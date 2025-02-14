import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/database/domain/entities/timetable.dart';
import 'package:focus_planner/features/database/domain/repo/db_repo.dart';

class FirestoreDbRepo implements DbRepo {
  CollectionReference timetableData =
      FirebaseFirestore.instance.collection('Timetables');
  CollectionReference taskData = FirebaseFirestore.instance.collection('Tasks');
  CollectionReference holidaysData =
      FirebaseFirestore.instance.collection('Holidays');
  CollectionReference exercicesData =
      FirebaseFirestore.instance.collection('Exercices');
  CollectionReference schoolLevelData =
      FirebaseFirestore.instance.collection('School Level');
  CollectionReference challengesData =
      FirebaseFirestore.instance.collection('Challenges');
  CollectionReference connectedDevicesData =
      FirebaseFirestore.instance.collection('Connected Devices');

  @override
  Future<void> createTimetableData(Timetable? data, AppUser currentUser) {
    return timetableData.add({
      'day': data!.day,
      'subjectName': data.subjectName,
      'from': data.from,
      'to': data.to,
    });
  }

  @override
  Stream<QuerySnapshot> readTimetableData() {
    final timetablesStream =
        timetableData.orderBy('timestamp', descending: true).snapshots();
    return timetablesStream;
  }
}
