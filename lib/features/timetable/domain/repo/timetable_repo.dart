import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/database/domain/entities/timetable.dart';

abstract class TimetableRepo {
  Future<void> createTimetableData(Timetable? data, AppUser currentUser);
  Stream<QuerySnapshot> readTimetableData();
  Future<Timetable> updateTimetableData(String? docId);
  Future<Timetable> deleteTimetableData(String? docId);
}