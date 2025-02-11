import 'package:equatable/equatable.dart';

abstract class TimetableEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTimetable extends TimetableEvent {
  final String filePath;

  LoadTimetable(this.filePath);

  @override
  List<Object?> get props => [filePath];
}

class SearchTimetable extends TimetableEvent {
  final String query;
  final String filterBy; // 'time', 'monday', 'tuesday', etc.

  SearchTimetable({
    required this.query,
    required this.filterBy,
  });

  @override
  List<Object?> get props => [query, filterBy];
}
