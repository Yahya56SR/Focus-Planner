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
      'userId': currentUser.uid,
      'timestamp': FieldValue.serverTimestamp()
    });
  }

  @override
  Stream<QuerySnapshot> readTimetableData() {
    final timetablesStream =
        timetableData.orderBy('timestamp', descending: true).snapshots();
    return timetablesStream;
  }

  @override
  Future<void> updateTimetableData(String docId, Timetable data) {
    return timetableData.doc(docId).update({
      'day': data.day,
      'subjectName': data.subjectName,
      'from': data.from,
      'to': data.to,
      'timestamp': FieldValue.serverTimestamp()
    });
  }

  Future<void> deleteTimetableData(String docId) {
    return timetableData.doc(docId).delete();
  }

  Future<void> createTask(Map<String, dynamic> taskData, AppUser currentUser) {
    return this.taskData.add({
      ...taskData,
      'userId': currentUser.id,
      'timestamp': FieldValue.serverTimestamp()
    });
  }

  Stream<QuerySnapshot> readTasks(AppUser currentUser) {
    return taskData
        .where('userId', isEqualTo: currentUser.uid)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> updateTask(String docId, Map<String, dynamic> taskData) {
    return this
        .taskData
        .doc(docId)
        .update({...taskData, 'timestamp': FieldValue.serverTimestamp()});
  }

  Future<void> deleteTask(String docId) {
    return this.taskData.doc(docId).delete();
  }

  Future<void> createHoliday(Map<String, dynamic> holidayData) {
    return holidaysData
        .add({...holidayData, 'timestamp': FieldValue.serverTimestamp()});
  }

  Stream<QuerySnapshot> readHolidays() {
    return holidaysData.orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> updateHoliday(String docId, Map<String, dynamic> holidayData) {
    return holidaysData
        .doc(docId)
        .update({...holidayData, 'timestamp': FieldValue.serverTimestamp()});
  }

  Future<void> deleteHoliday(String docId) {
    return holidaysData.doc(docId).delete();
  }

  Future<void> createExercice(Map<String, dynamic> exerciceData) {
    return exercicesData
        .add({...exerciceData, 'timestamp': FieldValue.serverTimestamp()});
  }

  Stream<QuerySnapshot> readExercices() {
    return exercicesData.orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> updateExercice(String docId, Map<String, dynamic> exerciceData) {
    return exercicesData
        .doc(docId)
        .update({...exerciceData, 'timestamp': FieldValue.serverTimestamp()});
  }

  Future<void> deleteExercice(String docId) {
    return exercicesData.doc(docId).delete();
  }

  Future<void> createSchoolLevel(Map<String, dynamic> schoolLevelData) {
    return this
        .schoolLevelData
        .add({...schoolLevelData, 'timestamp': FieldValue.serverTimestamp()});
  }

  Stream<QuerySnapshot> readSchoolLevels() {
    return schoolLevelData.orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> updateSchoolLevel(
      String docId, Map<String, dynamic> schoolLevelData) {
    return this.schoolLevelData.doc(docId).update(
        {...schoolLevelData, 'timestamp': FieldValue.serverTimestamp()});
  }

  Future<void> deleteSchoolLevel(String docId) {
    return this.schoolLevelData.doc(docId).delete();
  }

  Future<void> createChallenge(Map<String, dynamic> challengeData) {
    return challengesData
        .add({...challengeData, 'timestamp': FieldValue.serverTimestamp()});
  }

  Stream<QuerySnapshot> readChallenges() {
    return challengesData.orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> updateChallenge(
      String docId, Map<String, dynamic> challengeData) {
    return challengesData
        .doc(docId)
        .update({...challengeData, 'timestamp': FieldValue.serverTimestamp()});
  }

  Future<void> deleteChallenge(String docId) {
    return challengesData.doc(docId).delete();
  }

  Future<void> createConnectedDevice(Map<String, dynamic> deviceData) {
    return connectedDevicesData
        .add({...deviceData, 'timestamp': FieldValue.serverTimestamp()});
  }

  Stream<QuerySnapshot> readConnectedDevices() {
    return connectedDevicesData
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> updateConnectedDevice(
      String docId, Map<String, dynamic> deviceData) {
    return connectedDevicesData
        .doc(docId)
        .update({...deviceData, 'timestamp': FieldValue.serverTimestamp()});
  }

  Future<void> deleteConnectedDevice(String docId) {
    return connectedDevicesData.doc(docId).delete();
  }
}
