import 'package:equatable/equatable.dart';

class TimetableEntry extends Equatable {
  final String subject;
  final String teacher;
  final String room;
  final int dayOfWeek; // 1-7
  final int periodNumber;
  final String className;

  const TimetableEntry({
    required this.subject,
    required this.teacher,
    required this.room,
    required this.dayOfWeek,
    required this.periodNumber,
    required this.className,
  });

  factory TimetableEntry.fromExcelRow(List<dynamic> row) {
    return TimetableEntry(
      subject: row[0].toString(),
      teacher: row[1].toString(),
      room: row[2].toString(),
      dayOfWeek: int.parse(row[3].toString()),
      periodNumber: int.parse(row[4].toString()),
      className: row[5].toString(),
    );
  }

  bool isValid() {
    return subject.isNotEmpty &&
        teacher.isNotEmpty &&
        room.isNotEmpty &&
        dayOfWeek >= 1 &&
        dayOfWeek <= 7 &&
        periodNumber > 0;
  }

  @override
  List<Object?> get props =>
      [subject, teacher, room, dayOfWeek, periodNumber, className];
}
