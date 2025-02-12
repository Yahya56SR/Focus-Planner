import 'package:focus_planner/features/enum/country.dart';

class Holiday {
  final Country? country;
  final List<String?> holidays;

  Holiday({
    this.country,
    required this.holidays,
  });
}
