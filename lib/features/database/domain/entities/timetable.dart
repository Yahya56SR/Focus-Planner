import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_planner/features/database/domain/entities/subject.dart';

class Timetable {
  final Subject subjectName;
  final String from;
  final String to;
  final String day;

  Timetable({
    required this.subjectName,
    required this.from,
    required this.to,
    required this.day,
  });

  factory Timetable.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Timetable(
      day: data['day'],
      subjectName: data['subjectName'],
      from: data['from'],
      to: data['to'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'subjectName': subjectName,
      'from': from,
      'to': to,
    };
  }
}
