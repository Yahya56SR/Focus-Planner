import 'package:equatable/equatable.dart';
import 'package:focus_planner/features/import/xlsx/models/timetable_entry.dart';

abstract class TimetableState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TimetableInitial extends TimetableState {}

class TimetableLoading extends TimetableState {}

class TimetableLoaded extends TimetableState {
  final List<TimetableEntry> entries;
  final List<TimetableEntry> filteredEntries;

  TimetableLoaded({
    required this.entries,
    this.filteredEntries = const [],
  });

  @override
  List<Object?> get props => [entries, filteredEntries];
}

class TimetableError extends TimetableState {
  final String message;

  TimetableError(this.message);

  @override
  List<Object?> get props => [message];
}
