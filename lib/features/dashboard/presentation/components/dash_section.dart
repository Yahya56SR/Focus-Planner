import 'package:flutter/material.dart';
import 'package:focus_planner/features/dashboard/presentation/components/card.dart';

class DashSection extends StatelessWidget {
  final String title;
  final List<String> contentTitles;
  final Map<String, dynamic> contentSubtitles;
  final bool isTimetable;
  const DashSection({
    super.key,
    this.title = 'Timetables',
    this.contentTitles = const [
      '3',
      '6',
      '4',
      '1',
    ],
    this.contentSubtitles = const {
      'Geography': null,
      'Science': null,
      'Art': null,
      'Chemistry': null,
    },
    required this.isTimetable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (index == contentTitles.length) {
                return const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    MySubjectCard(),
                  ],
                );
              }
              return Row(
                children: [
                  MySubjectCard(
                    subId: contentTitles.elementAt(index),
                    subjectTiming: contentSubtitles.values.elementAt(index),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              );
            },
            itemCount: contentTitles.length + 1,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
