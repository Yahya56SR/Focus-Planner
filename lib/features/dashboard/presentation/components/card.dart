import 'package:flutter/material.dart';
import 'package:focus_planner/features/database/domain/entities/subject.dart';
import 'package:focus_planner/themes/light_mode.dart';

class MyCard extends StatelessWidget {
  final String? subId;
  final DateTime? subjectTiming;

  const MyCard({
    super.key,
    this.subId,
    this.subjectTiming,
  });

  String _checkDay(int day) {
    switch (day) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return 'Error while checking day';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Early return if no subject or timing
    if (subjectTiming == null && subId == null) {
      return Container(
        width: 200,
        height: 300,
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "That's All !",
          ),
        ),
      );
    }

    return Container(
      width: 200,
      height: 900,
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              width: 200,
              decoration: BoxDecoration(
                color: blue200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                Subject().getSubjectById(context, subId ?? '')!.thumbPath!,
                scale: 5,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    Subject().getSubjectById(context, subId ?? '')?.subName ??
                        'Subject Name',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subjectTiming != null
                            ? '${_checkDay(subjectTiming!.day)} At \n${subjectTiming!.hour.toString()}:${subjectTiming!.minute.toString()}'
                            : 'No timing set',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
