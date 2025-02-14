import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_planner/features/Timetables/domain/entities/subject.dart';

class Timetable {
  final Subject subjectName;
  final Timestamp from;
  final Timestamp to;
  final Timestamp day;

  Timetable({
    required this.subjectName,
    required this.from,
    required this.to,
    required this.day,
  });
}
