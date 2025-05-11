import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_planner/features/enum/tag.dart';

// --- Helper functions (inchangées) ---
Map<String, int> timeOfDayToMap(TimeOfDay time) {
  return {'hour': time.hour, 'minute': time.minute};
}

TimeOfDay mapToTimeOfDay(Map<String, dynamic> map) {
  return TimeOfDay(hour: map['hour'] as int, minute: map['minute'] as int);
}
// --------------------------------------

class Task {
  final String thumbPath;
  final String taskTitle;
  final TimeOfDay progTime; // L'heure à laquelle la tâche a lieu chaque jour
  final TimeOfDay todoBefore;
  final Tag tag;
  final bool isRecurringDaily; // <-- Nouveau champ

  Task({
    required this.thumbPath,
    required this.taskTitle,
    required this.tag,
    required this.progTime,
    required this.todoBefore,
    required this.isRecurringDaily, // <-- Ajouter au constructeur
  });

  factory Task.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return Task(
      thumbPath: data['thumbPath'] ?? 'images/task_default.jpg',
      taskTitle: data['taskTitle'] ?? '',
      tag: Tag.values.firstWhere(
            (e) => e.name == data['tag'],
            orElse: () => Tag.routineTasks,
      ),
      progTime: mapToTimeOfDay(data['progTime'] as Map<String, dynamic>),
      todoBefore: mapToTimeOfDay(data['todoBefore'] as Map<String, dynamic>),
      // Lit le nouveau champ, avec une valeur par défaut false si absent
      isRecurringDaily: data['isRecurringDaily'] as bool? ?? false, // <-- Lire depuis Firestore
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbPath': thumbPath,
      'taskTitle': taskTitle,
      'progTime': timeOfDayToMap(progTime),
      'todoBefore': timeOfDayToMap(todoBefore),
      'tag': tag.name,
      'isRecurringDaily': isRecurringDaily, // <-- Ajouter à toJson
    };
  }
}