import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/auth/presentation/components/text_field.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/features/database/data/firestore_db_repo.dart';
import 'package:focus_planner/features/database/presentation/cubits/db_cubit.dart';
import 'package:focus_planner/features/enum/tag.dart';
import 'package:intl/intl.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final TextEditingController _controller = TextEditingController();
  int itemCount = 1;
  List<String> tasks = ['Task No° ${Random().nextInt(1)}'];
  final FirestoreDbRepo firestoreDbRepo = FirestoreDbRepo();
  List<DateTime?> programmedDates =
      List<DateTime?>.filled(double.maxFinite.toInt(), null, growable: true);
  List<TimeOfDay?> programmedTimes =
      List<TimeOfDay?>.filled(double.maxFinite.toInt(), null, growable: true);

  void saveTasks() async {
    final dbCubit = context.read<DbCubit>();
    final authCubit = context.read<AuthCubit>();
    final currentUser = FirebaseAuth.instance.currentUser;
    FirestoreDbRepo dbRepo = FirestoreDbRepo();
    AppUser? userDoc;

    if (currentUser != null) {
      final userId = currentUser.uid;
      try {
        userDoc = await dbRepo.getCurrentUserDoc(userId);
        debugPrint(
            "User document exists: ${userDoc.toJson()}"); // Assuming toJson() is the correct method
      } catch (error) {
        debugPrint("Error fetching user: $error");
        return;
      }
    } else {
      debugPrint("No user is currently logged in.");
      return;
    }

    if (userDoc.name.isEmpty) {
      debugPrint("Error: User document not found or username is missing.");
      return;
    }

    for (var task in tasks) {
      dbCubit.addTaskData(
        {
          'thumbnail': "images/task_default.jpg",
          'taskTitle': task,
          'programmedDate': programmedDates[tasks.indexOf(task)] != null
              ? DateFormat('yyyy-MM-dd')
                  .format(programmedDates[tasks.indexOf(task)]!)
              : "every day",
          'programmedTime':
              programmedTimes[tasks.indexOf(task)]?.format(context) ??
                  "Not set",
          'todoBefore': programmedTimes[tasks.indexOf(task)] != null
              ? programmedTimes[tasks.indexOf(task)]!
                  .replacing(hour: 23, minute: 59)
                  .format(context)
              : "end of day",
          'tag': Tag.routineTasks,
          'isFinished': false,
        },
        currentUser.uid,
      ).catchError((error) {
        debugPrint("Error adding task: $error");
      }).then((_) {
        debugPrint("Task added successfully");
      });
    }
  }

  // ignore: unused_element
  void _addItem() {
    setState(() {
      itemCount++;
      tasks.add(_controller.text);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void _removeItem(int index) {
    setState(() {
      itemCount--;
      tasks.removeAt(index);
    });
  }

  void _editItem(int index) {
    setState(() {
      tasks[index] = _controller.text;
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  Future<void> _pickTime(BuildContext context, int index) async {
    final timePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (timePicked != null) {
      setState(() {
        programmedTimes[index] = timePicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios_rounded),
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(
            'Routine Tasks',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.onSurface,
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
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                            autoClose: true,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SlidableAction(
                              icon: Icons.edit,
                              label: 'Edit',
                              borderRadius: BorderRadius.circular(8),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              onPressed: (context) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Edit Task'),
                                      content: MyTextField(
                                        hintText: 'Task',
                                        obscureText: false,
                                        controller: _controller,
                                        keyboardType: TextInputType.text,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => _editItem(index),
                                          child: Text('Edit'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }),
                        ],
                      ),
                      child: ListTile(
                        title: Text(tasks[index]),
                        trailing: Icon(Icons.arrow_forward_ios),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () => _pickTime(context, index),
                              child: Text(
                                programmedTimes[index] != null
                                    ? programmedTimes[index]!.format(context)
                                    : 'Pick a time',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 12,
          children: [
            FloatingActionButton(
              heroTag: 'addTaskButton',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Add Task'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyTextField(
                            hintText: 'Task',
                            obscureText: false,
                            controller: _controller,
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: _addItem,
                          child: Text('Add'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: 'submitTasksButton',
              onPressed: saveTasks,
              child: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ));
  }
}
