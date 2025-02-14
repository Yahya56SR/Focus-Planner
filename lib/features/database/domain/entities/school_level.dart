import 'package:focus_planner/features/enum/country.dart';

class SchoolLevel {
  final Country country;
  final String schoolLevel;
  final List<String> subjects;

  SchoolLevel(
      {required this.country,
      required this.schoolLevel,
      required this.subjects});
}
