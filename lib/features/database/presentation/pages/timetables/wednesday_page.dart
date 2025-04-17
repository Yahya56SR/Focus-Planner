import 'package:flutter/material.dart';
import 'package:focus_planner/features/auth/presentation/components/spacer.dart';
import 'package:focus_planner/features/database/domain/entities/subject.dart';
import 'package:focus_planner/l10n/app_localizations.dart';
import 'package:focus_planner/l10n/components/my_lang_changer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WednesdayPage extends StatefulWidget {
  final Locale? currentLocale;
  final void Function(Locale) setLocale;
  final void Function(String) nextDay;
  const WednesdayPage(
      {super.key,
      this.currentLocale,
      required this.setLocale,
      required this.nextDay});

  @override
  State<WednesdayPage> createState() => _WednesdayPageState();
}

class _WednesdayPageState extends State<WednesdayPage> {
  final subjectController = TextEditingController();
  int itemCount = 2;
  List<String?> selectedSubjects =
      List<String?>.filled(2, null, growable: true);
  List<TimeOfDay?> startTimes =
      List<TimeOfDay?>.filled(2, null, growable: true);
  List<TimeOfDay?> endTimes = List<TimeOfDay?>.filled(2, null, growable: true);
  late List<String> subjectNames;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final subjectsList = getSubjects(context);
    subjectNames = subjectsList.map((subject) => subject.subName!).toList();
  }

  @override
  void dispose() {
    subjectController.dispose();
    super.dispose();
  }

  void _addItem() {
    setState(() {
      itemCount++;
      selectedSubjects.add(null);
      startTimes.add(null);
      endTimes.add(null);
    });
  }

  void _removeItem(int index) {
    setState(() {
      itemCount--;
      selectedSubjects.removeAt(index);
      startTimes.removeAt(index);
      endTimes.removeAt(index);
    });
  }

  Future<void> _pickTime(
      BuildContext context, int index, bool isStartTime) async {
    final timePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (timePicked != null) {
      setState(() {
        if (isStartTime) {
          startTimes[index] = timePicked;
        } else {
          endTimes[index] = timePicked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.wednesdayTitle,
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
                          label: AppLocalizations.of(context)!.delete,
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
                          hint:
                              Text(AppLocalizations.of(context)!.subjectChoice),
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
                          isExpanded: true,
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
                              onTap: () => _pickTime(context, index, true),
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
                                  startTimes[index] == null
                                      ? ' : '
                                      : '${startTimes[index]!.hour} : ${startTimes[index]!.minute}',
                                  textAlign: TextAlign.center,
                                  style: startTimes[index] != null
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
                              onTap: () => _pickTime(context, index, false),
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
                                  endTimes[index] == null
                                      ? ' : '
                                      : '${endTimes[index]!.hour} : ${endTimes[index]!.minute}',
                                  textAlign: TextAlign.center,
                                  style: endTimes[index] != null
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
                  onPressed: _addItem,
                  icon: Icon(
                    Icons.add,
                  ),
                  iconSize: 75,
                ),
                Spacer(),
                IconButton.filled(
                  onPressed: () => widget.nextDay('Wednesday'),
                  icon: Icon(
                    Icons.arrow_circle_right_outlined,
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
