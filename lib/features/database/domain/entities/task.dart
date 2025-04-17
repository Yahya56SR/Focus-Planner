import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_planner/features/enum/tag.dart';

class Task {
  final String thumbPath;
  final String taskTitle;
  final Timestamp progDate;
  final Timestamp progTime;
  final Timestamp todoBefore;
  final Tag tag;

  Task({
    required this.thumbPath,
    required this.taskTitle,
    required this.tag,
    required this.progDate,
    required this.progTime,
    required this.todoBefore,
  });

  factory Task.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Task(
      thumbPath: data['thumbPath'],
      taskTitle: data['taskTitle'],
      tag: data['tag'],
      progDate: data['progDate'],
      progTime: data['progTime'],
      todoBefore: data['todoBefore'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbPath': thumbPath,
      'taskTitle': taskTitle,
      'progDate': progDate,
      'progTime': progTime,
      'todoBefore': todoBefore,
      'tag': tag,
    };
  }
}
