import 'package:flutter/material.dart';
import 'package:focus_planner/features/dashboard/presentation/components/dash_section.dart';
import 'package:focus_planner/themes/light_mode.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: grey900,
              ),
        ),
        centerTitle: true,
        backgroundColor: grey50,
        foregroundColor: grey900,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                DashSection(
                  title: 'Timetables',
                  contentTitles: [
                    '3',
                    '6',
                    '4',
                    '1',
                  ],
                  contentSubtitles: {
                    'Geography': DateTime(0, 0, DateTime.monday, 8, 30),
                    'Scince': DateTime(0, 0, DateTime.monday, 9, 30),
                    'Art': DateTime(0, 0, DateTime.monday, 10, 30),
                    'Chemistry': DateTime(0, 0, DateTime.monday, 11, 30),
                  },
                ),
                DashSection(
                  title: 'Exercices',
                  contentTitles: [
                    '5',
                    '2',
                    '12',
                    '7',
                    '10',
                    '8',
                    '9',
                  ],
                  contentSubtitles: {
                    '5': DateTime(0, 0, DateTime.monday, 8, 30),
                    '2': DateTime(0, 0, DateTime.monday, 9, 30),
                    '12': DateTime(0, 0, DateTime.monday, 10, 30),
                    '7': DateTime(0, 0, DateTime.tuesday, 11, 30),
                    '10': DateTime(0, 0, DateTime.tuesday, 12, 30),
                    '8': DateTime(0, 0, DateTime.tuesday, 14, 30),
                    '9': DateTime(0, 0, DateTime.tuesday, 15, 30),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
