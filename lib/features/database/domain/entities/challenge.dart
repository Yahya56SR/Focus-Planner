import 'package:focus_planner/features/enum/difficulty.dart';
import 'package:focus_planner/features/enum/level.dart';

class Challenge {
  final String thumbPath;
  final String title;
  final Level level;
  final Difficulty difficulty;

  Challenge(this.thumbPath, this.title, this.level, this.difficulty);
}
