import 'package:flutter/material.dart';
import 'package:focus_planner/features/auth/presentation/components/spacer.dart';
import 'package:focus_planner/features/auth/presentation/components/text_field.dart';
import 'package:focus_planner/features/database/domain/entities/subject.dart';
import 'package:focus_planner/l10n/app_localizations.dart';
import 'package:focus_planner/l10n/components/my_lang_changer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
  TimeOfDay? _pickedTime;
  int itemCount = 2;
  List<String?> selectedSubjects =
      List<String?>.filled(2, null, growable: true);
  final List<String> subjectNames =
      subjects.map((subject) => subject.subName!).toList();

  @override
  void dispose() {
    subjectController.dispose();
    super.dispose();
  }

  void _addItem() {
    setState(() {
      itemCount++;
      selectedSubjects.add(null);
    });
  }

  void _removeItem(int index) {
    setState(() {
      itemCount--;
      selectedSubjects.removeAt(index);
    });
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
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => _removeItem(index),
                          icon: Icons.delete_outlined,
                          label: 'Delete',
                          borderRadius: BorderRadius.circular(8),
                          backgroundColor: Theme.of(context).colorScheme.error,
                          autoClose: true,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        DropdownButton<String>(
                          value: selectedSubjects[index],
                          hint: Text('Select a subject'),
                          items: subjectNames.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedSubjects[index] = newValue;
                            });
                          },
                        ),
                        AddSpace(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${AppLocalizations.of(context)!.from} :',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            GestureDetector(
                              onTap: () {
                                final timePicked = showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                timePicked.then((value) {
                                  setState(() {
                                    _pickedTime = value;
                                  });
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .inputDecorationTheme
                                      .fillColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: 250,
                                child: Text(
                                  _pickedTime == null
                                      ? ' : '
                                      : '${_pickedTime!.hour} : ${_pickedTime!.minute}',
                                  textAlign: TextAlign.center,
                                  style: _pickedTime != null
                                      ? Theme.of(context).textTheme.bodyMedium
                                      : Theme.of(context)
                                          .inputDecorationTheme
                                          .hintStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        AddSpace(
                          height: 9,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${AppLocalizations.of(context)!.to} :',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            GestureDetector(
                              onTap: () {
                                final timePicked = showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                timePicked.then((value) {
                                  setState(() {
                                    _pickedTime = value;
                                  });
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .inputDecorationTheme
                                      .fillColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: 250,
                                child: Text(
                                  _pickedTime == null
                                      ? ' : '
                                      : '${_pickedTime!.hour} : ${_pickedTime!.minute}',
                                  textAlign: TextAlign.center,
                                  style: _pickedTime != null
                                      ? Theme.of(context).textTheme.bodyMedium
                                      : Theme.of(context)
                                          .inputDecorationTheme
                                          .hintStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton.filled(
                  onPressed: () => widget.nextDay('Monday'),
                  icon: Icon(
                    Icons.arrow_circle_right_outlined,
                  ),
                  iconSize: 75,
                ),
                Spacer(),
                IconButton.filled(
                  onPressed: _addItem,
                  icon: Icon(
                    Icons.add,
                  ),
                  iconSize: 75,
                ),
              ],
            ),
          ),
          MyLangChanger(
            setLocale: widget.setLocale,
            currentLocale: widget.currentLocale,
          )
        ],
      ),
    );
  }
}
