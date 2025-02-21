import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:excel/excel.dart';
import 'package:focus_planner/features/import/xlsx/blocs/timetable_event.dart';
import 'package:focus_planner/features/import/xlsx/blocs/timetable_state.dart';
import 'package:focus_planner/features/import/xlsx/models/timetable_entry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:universal_platform/universal_platform.dart';

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

      List<int> bytes;
      if (UniversalPlatform.isWeb) {
        bytes = event.fileBytes!;
      } else {
        bytes = File(event.filePath).readAsBytesSync();
      }

      final excel = Excel.decodeBytes(Uint8List.fromList(bytes));
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

      // Convert entries to a map of subjects and save to Firebase
      List<Map<String, dynamic>> subjectMaps = [];
      for (var entry in entries) {
        final days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday'];
        for (var day in days) {
          final subject = entry.toJson()[day];
          if (subject!.isNotEmpty) {
            final timeRange = entry.time.split('-');
            try {
              final from = _parseTime(timeRange[0].trim());
              final to = _parseTime(timeRange[1].trim());
              final subjectMap = {
                'subjectName': subject,
                'from': Timestamp.fromDate(from),
                'to': Timestamp.fromDate(to),
                'day': day,
              };
              subjectMaps.add(subjectMap);

              // Save to Firebase
              await FirebaseFirestore.instance
                  .collection('timetables')
                  .add(subjectMap);
            } catch (e) {
              print('Error parsing time for entry: ${entry.toJson()}');
              print('Error details: ${e.toString()}');
              continue;
            }
          }
        }
      }

      // Print subjects map to the console
      print(const JsonEncoder.withIndent('  ').convert(subjectMaps));

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

  DateTime _parseTime(String timeStr) {
    final timeFormat = DateFormat('HH:mm');
    final today = DateTime.now();
    final parsedTime = timeFormat.parse(timeStr);
    return DateTime(
        today.year, today.month, today.day, parsedTime.hour, parsedTime.minute);
  }
}
