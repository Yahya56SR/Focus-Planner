import 'package:flutter/material.dart';
import 'package:focus_planner/features/auth/presentation/components/text_field.dart';

class MondayPage extends StatefulWidget {
  final Locale? currentLocale;
  final void Function(Locale) setLocale;
  final void Function(String) nextDay;
  const MondayPage(
      {super.key,
      this.currentLocale,
      required this.setLocale,
      required this.nextDay});

  @override
  State<MondayPage> createState() => _MondayPageState();
}

class _MondayPageState extends State<MondayPage> {
  final subjectController = TextEditingController();

  @override
  void dispose() {
    subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Monday Timetable',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    MyTextField(
                      controller: subjectController,
                      hintText: 'Subject',
                      obscureText: false,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
