import 'package:bloc/bloc.dart';
import 'package:excel/excel.dart';
import 'package:focus_planner/features/import/xlsx/blocs/timetable_event.dart';
import 'package:focus_planner/features/import/xlsx/blocs/timetable_state.dart';
import 'package:focus_planner/features/import/xlsx/models/timetable_entry.dart';
import 'dart:io';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  TimetableBloc() : super(TimetableInitial()) {
    on<LoadTimetable>(_onLoadTimetable);
    on<SearchTimetable>(_onSearchTimetable);
  }

  Future<void> _onLoadTimetable(
    LoadTimetable event,
    Emitter<TimetableState> emit,
  ) async {
    try {
      emit(TimetableLoading());

      final bytes = File(event.filePath).readAsBytesSync();
      final excel = Excel.decodeBytes(bytes);
      final sheet = excel.tables[excel.tables.keys.first]!;

      List<TimetableEntry> entries = [];

      // Skip header row
      for (var row in sheet.rows.skip(1)) {
        try {
          if (row.every(
              (cell) => cell == null || cell.toString().trim().isEmpty)) {
            continue; // Skip empty rows
          }
          final entry = TimetableEntry.fromExcelRow(row);
          if (entry.isValid()) {
            entries.add(entry);
          }
        } catch (e) {
          // Skip invalid rows
          continue;
        }
      }

      emit(TimetableLoaded(entries: entries, filteredEntries: entries));
    } catch (e) {
      emit(TimetableError('Failed to load timetable: ${e.toString()}'));
    }
  }

  void _onSearchTimetable(
    SearchTimetable event,
    Emitter<TimetableState> emit,
  ) {
    if (state is TimetableLoaded) {
      final currentState = state as TimetableLoaded;
      final query = event.query.toLowerCase();

      if (query.isEmpty) {
        emit(TimetableLoaded(
          entries: currentState.entries,
          filteredEntries: currentState.entries,
        ));
        return;
      }

      final filteredEntries = currentState.entries.where((entry) {
        switch (event.filterBy) {
          case 'time':
            return entry.time.toLowerCase().contains(query);
          case 'monday':
            return entry.monday.toLowerCase().contains(query);
          case 'tuesday':
            return entry.tuesday.toLowerCase().contains(query);
          case 'wednesday':
            return entry.wednesday.toLowerCase().contains(query);
          case 'thursday':
            return entry.thursday.toLowerCase().contains(query);
          case 'friday':
            return entry.friday.toLowerCase().contains(query);
          default:
            return false;
        }
      }).toList();

      emit(TimetableLoaded(
        entries: currentState.entries,
        filteredEntries: filteredEntries,
      ));
    }
  }
}
