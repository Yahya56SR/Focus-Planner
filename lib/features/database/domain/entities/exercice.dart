import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_planner/features/enum/difficulty.dart';

class Exercice {
  final String subName;
  final Timestamp forDate;
  final Timestamp atTime;
  final Difficulty difficulty;
  final bool isFinished;

  Exercice({
    required this.subName,
    required this.atTime,
    required this.difficulty,
    required this.forDate,
    required this.isFinished,
  });

  factory Exercice.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Exercice(
      subName: data['subName'],
      forDate: data['forDate'],
      atTime: data['atTime'],
      difficulty: Difficulty.values[data['difficulty']],
      isFinished: data['isFinished'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subName': subName,
      'forDate': forDate,
      'atTime': atTime,
      'difficulty': difficulty,
      'isFinished': isFinished,
    };
  }
}
