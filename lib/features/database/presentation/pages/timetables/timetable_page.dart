import 'package:flutter/material.dart';
import 'package:focus_planner/features/database/presentation/pages/timetables/friday_page.dart';
import 'package:focus_planner/features/database/presentation/pages/timetables/monday_timetable_page.dart';
import 'package:focus_planner/features/database/presentation/pages/timetables/saturday_page.dart';
import 'package:focus_planner/features/database/presentation/pages/timetables/thursday_page.dart';
import 'package:focus_planner/features/database/presentation/pages/timetables/tuesday_page.dart';
import 'package:focus_planner/features/database/presentation/pages/timetables/wednesday_page.dart';

class TimetablePage extends StatefulWidget {
  final Locale? currentLocale;
  final void Function(Locale) setLocale;
  const TimetablePage({super.key, this.currentLocale, required this.setLocale});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  String currentPage = 'monday';

  void nextDay(String thisPage) {
    setState(() {
      switch (thisPage.toLowerCase()) {
        case 'monday':
          currentPage = 'tuesday';
          break;
        case 'tuesday':
          currentPage = 'wednesday';
          break;
        case 'wednesday':
          currentPage = 'thursday';
          break;
        case 'thursday':
          currentPage = 'friday';
          break;
        case 'friday':
          currentPage = 'saturday';
          break;
        case 'saturday':
          Navigator.pop(context, 'Timetable Completed');
          break;
        default:
          throw ErrorSummary('Unknown day: $thisPage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (currentPage.toLowerCase()) {
      case 'saturday':
        return SaturdayPage(
          setLocale: widget.setLocale,
          nextDay: nextDay,
          currentLocale: widget.currentLocale,
        );
      case 'friday':
        return FridayPage(
          setLocale: widget.setLocale,
          nextDay: nextDay,
          currentLocale: widget.currentLocale,
        );
      case 'thursday':
        return ThursdayPage(
          setLocale: widget.setLocale,
          nextDay: nextDay,
          currentLocale: widget.currentLocale,
        );
      case 'wednesday':
        return WednesdayPage(
          setLocale: widget.setLocale,
          nextDay: nextDay,
          currentLocale: widget.currentLocale,
        );
      case 'tuesday':
        return TuesdayPage(
          setLocale: widget.setLocale,
          nextDay: nextDay,
          currentLocale: widget.currentLocale,
        );
      case 'monday':
      default:
        return MondayPage(
          setLocale: widget.setLocale,
          nextDay: nextDay,
          currentLocale: widget.currentLocale,
        );
    }
  }
}
