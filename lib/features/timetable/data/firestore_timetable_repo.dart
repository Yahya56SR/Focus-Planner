import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/database/domain/entities/timetable.dart';
import 'package:focus_planner/features/timetable/domain/repo/timetable_repo.dart';

class FirestoreTimetableRepo implements TimetableRepo {
  CollectionReference timetableData =
      FirebaseFirestore.instance.collection('Timetables');

  @override
  Future<void> createTimetableData(Timetable? data, AppUser currentUser) {
    return timetableData.doc(currentUser.uid).set({
      'day': data!.day,
      'subjectName': data.subjectName,
      'from': data.from,
      'to': data.to,
    });
  }

  @override
  Stream<QuerySnapshot> readTimetableData() {
    return timetableData.orderBy('timestamp', descending: true).snapshots();
  }

  @override
  Future<Timetable> updateTimetableData(String? docId) async {
    DocumentSnapshot doc = await timetableData.doc(docId).get();
    return Timetable.fromSnapshot(doc);
  }

  @override
  Future<Timetable> deleteTimetableData(String? docId) async {
    DocumentSnapshot doc = await timetableData.doc(docId).get();
    await timetableData.doc(docId).delete();
    return Timetable.fromSnapshot(doc);
  }
}
