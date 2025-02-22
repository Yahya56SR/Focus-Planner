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
          showTuesdayPage = true;
          break;
        case 'tuesday':
          showWednesdayPage = true;
          break;
        case 'wednesday':
          showThursdayPage = true;
          break;
        case 'thursday':
          showFridayPage = true;
          break;
        case 'friday':
          showSaturdayPage = true;
          break;
        case 'saturday':
          Navigator.pop(context);
          break;
        default:
          throw Error();
      }
    }

    if (showSaturdayPage == true) {
      return SaturdayPage();
    } else if (showFridayPage == true) {
      return FridayPage();
    } else if (showThursdayPage == true) {
      return ThursdayPage();
    } else if (showWednesdayPage == true) {
      return WednesdayPage();
    } else if (showTuesdayPage == true) {
      return TuesdayPage();
    } else if (showMondayPage == true) {
      return MondayPage(setLocale: widget.setLocale, nextDay: nextDay);
    } else {
      return ScaffoldMessenger(
        child: Text('Unknown Error'),
      );
    }
  }
}
