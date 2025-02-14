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
}
