import 'package:equatable/equatable.dart';

abstract class TimetableEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTimetable extends TimetableEvent {
  final String filePath;
  final List<int>? fileBytes; // Add this field to support web

  LoadTimetable(this.filePath, {this.fileBytes});

  @override
  List<Object?> get props => [filePath, fileBytes];
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