import 'package:equatable/equatable.dart';
import 'package:excel/excel.dart';

class TimetableEntry extends Equatable {
  final String time;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;

  const TimetableEntry({
    required this.time,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
  });

  factory TimetableEntry.fromExcelRow(List<Data?> row) {
    if (row.length < 6) {
      throw StateError('Row does not have enough columns');
    }
    return TimetableEntry(
      time: row[0]?.value.toString() ?? '',
      monday: row[1]?.value.toString() ?? '',
      tuesday: row[2]?.value.toString() ?? '',
      wednesday: row[3]?.value.toString() ?? '',
      thursday: row[4]?.value.toString() ?? '',
      friday: row[5]?.value.toString() ?? '',
    );
  }

  bool isValid() {
    return time.isNotEmpty &&
        monday.isNotEmpty &&
        tuesday.isNotEmpty &&
        wednesday.isNotEmpty &&
        thursday.isNotEmpty &&
        friday.isNotEmpty;
  }

  Map<String, String> toJson() {
    return {
      'time': time,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
    };
  }

  @override
  List<Object?> get props =>
      [time, monday, tuesday, wednesday, thursday, friday];
}
