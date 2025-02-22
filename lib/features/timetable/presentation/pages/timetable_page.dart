import 'package:flutter/material.dart';
import 'package:focus_planner/features/timetable/presentation/pages/friday_page.dart';
import 'package:focus_planner/features/timetable/presentation/pages/monday_timetable_page.dart';
import 'package:focus_planner/features/timetable/presentation/pages/saturday_page.dart';
import 'package:focus_planner/features/timetable/presentation/pages/thursday_page.dart';
import 'package:focus_planner/features/timetable/presentation/pages/tuesday_page.dart';
import 'package:focus_planner/features/timetable/presentation/pages/wednesday_page.dart';

class TimetablePage extends StatefulWidget {
  final Locale? currentLocale;
  final void Function(Locale) setLocale;
  const TimetablePage({super.key, this.currentLocale, required this.setLocale});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  @override
  Widget build(BuildContext context) {
    bool showMondayPage = true;
    bool showTuesdayPage = false;
    bool showWednesdayPage = false;
    bool showThursdayPage = false;
    bool showFridayPage = false;
    bool showSaturdayPage = false;

    void nextDay(String thisPage) {
      switch (thisPage) {
        case 'monday':
          showMondayPage = false;
          showTuesdayPage = true;
          showWednesdayPage = false;
          showThursdayPage = false;
          showFridayPage = false;
          showSaturdayPage = false;
          break;
        case 'tuesday':
          showMondayPage = false;
          showTuesdayPage = true;
          showWednesdayPage = false;
          showThursdayPage = false;
          showFridayPage = false;
          showSaturdayPage = false;
          break;
        case 'wednesday':
          showMondayPage = false;
          showTuesdayPage = true;
          showWednesdayPage = false;
          showThursdayPage = false;
          showFridayPage = false;
          showSaturdayPage = false;
          break;
        case 'thursday':
          showMondayPage = false;
          showTuesdayPage = true;
          showWednesdayPage = false;
          showThursdayPage = false;
          showFridayPage = false;
          showSaturdayPage = false;
          break;
        case 'friday':
          showMondayPage = false;
          showTuesdayPage = true;
          showWednesdayPage = false;
          showThursdayPage = false;
          showFridayPage = false;
          showSaturdayPage = false;
          break;
        case 'saturday':
          Navigator.pop(context);
          break;
        default:
          throw Error();
      }
    }

    if (showSaturdayPage == true) {
      return SaturdayPage(
        setLocale: widget.setLocale,
        nextDay: nextDay,
        currentLocale: widget.currentLocale,
      );
    } else if (showFridayPage == true) {
      return FridayPage(
        setLocale: widget.setLocale,
        nextDay: nextDay,
        currentLocale: widget.currentLocale,
      );
    } else if (showThursdayPage == true) {
      return ThursdayPage(
        setLocale: widget.setLocale,
        nextDay: nextDay,
        currentLocale: widget.currentLocale,
      );
    } else if (showWednesdayPage == true) {
      return WednesdayPage(
        setLocale: widget.setLocale,
        nextDay: nextDay,
        currentLocale: widget.currentLocale,
      );
    } else if (showTuesdayPage == true) {
      return TuesdayPage(
        setLocale: widget.setLocale,
        nextDay: nextDay,
        currentLocale: widget.currentLocale,
      );
    } else if (showMondayPage == true) {
      return MondayPage(
        setLocale: widget.setLocale,
        nextDay: nextDay,
        currentLocale: widget.currentLocale,
      );
    } else {
      return ScaffoldMessenger(
        child: Text('Unknown Error'),
      );
    }
  }
}
