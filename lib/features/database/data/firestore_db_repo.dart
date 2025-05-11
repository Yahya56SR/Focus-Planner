import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/database/domain/entities/timetable.dart';
import 'package:focus_planner/features/database/domain/entities/task.dart';
import 'package:focus_planner/features/database/domain/entities/holiday.dart';
import 'package:focus_planner/features/database/domain/entities/exercice.dart';
import 'package:focus_planner/features/database/domain/entities/connected_devices.dart';
import 'package:focus_planner/features/database/domain/entities/school_level.dart';
import 'package:focus_planner/features/database/domain/repo/db_repo.dart';

class FirestoreDbRepo implements DbRepo {
  CollectionReference userData = FirebaseFirestore.instance.collection('Users');
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
  Future<void> createUserData(AppUser? user) {
    return userData.doc(user?.uid).set({
      'uid': user?.uid,
      'name': user?.name,
      'email': user?.email,
    });
  }

  @override
  Stream<QuerySnapshot<Object?>> readUserData(String? uid) {
    return userData.orderBy('timestamp', descending: true).snapshots();
  }

  @override
  Future<AppUser> updateUserData(AppUser? user) async {
    DocumentSnapshot doc = await userData.doc(user?.uid).get();
    return AppUser.fromSnapshot(doc);
  }

  @override
  Future<AppUser> deleteUserData(AppUser? user) async {
    DocumentSnapshot doc = await userData.doc(user?.uid).get();
    await userData.doc(user?.uid).delete();
    return AppUser.fromSnapshot(doc);
  }

  @override
  Future<AppUser> getCurrentUserDoc(String? uid) async {
    DocumentSnapshot doc = await userData.doc(uid).get();
    return AppUser.fromSnapshot(doc);
  }

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

  @override
  Future<void> createTaskData(Task? data, String? docId) {
    if (docId != null) {
      // Si un ID est fourni (pour une mise à jour potentielle future)
      return taskData.doc(docId).set(data?.toJson());
    } else {
      // Si aucun ID n'est fourni (pour une nouvelle tâche), utilise add()
      // pour générer un ID automatiquement.
      return taskData.add(data?.toJson());
    }
  }

  @override
  Stream<QuerySnapshot> readTaskData() {
    return taskData.snapshots();
  }

  @override
  Future<Task> updateTaskData(String? docId) async {
    DocumentSnapshot doc = await taskData.doc(docId).get();
    return Task.fromSnapshot(doc);
  }

  @override
  Future<Task> deleteTaskData(String? docId) async {
    DocumentSnapshot doc = await taskData.doc(docId).get();
    await taskData.doc(docId).delete();
    return Task.fromSnapshot(doc);
  }

  @override
  Future<void> createHolidayData(Holiday? data) {
    return holidaysData.add({'data': data});
  }

  @override
  Stream<QuerySnapshot> readHolidayData() {
    return holidaysData.snapshots();
  }

  @override
  Future<Holiday> updateHolidayData(String? docId) async {
    DocumentSnapshot doc = await holidaysData.doc(docId).get();
    return Holiday.fromSnapshot(doc);
  }

  @override
  Future<Holiday> deleteHolidayData(String? docId) async {
    DocumentSnapshot doc = await holidaysData.doc(docId).get();
    await holidaysData.doc(docId).delete();
    return Holiday.fromSnapshot(doc);
  }

  @override
  Future<void> createExerciseData(Exercice? data) {
    return exercicesData.add({'data': data});
  }

  @override
  Stream<QuerySnapshot> readExerciseData() {
    return exercicesData.snapshots();
  }

  @override
  Future<Exercice> updateExerciseData(String? docId) async {
    DocumentSnapshot doc = await exercicesData.doc(docId).get();
    return Exercice.fromSnapshot(doc);
  }

  @override
  Future<Exercice> deleteExerciseData(String? docId) async {
    DocumentSnapshot doc = await exercicesData.doc(docId).get();
    await exercicesData.doc(docId).delete();
    return Exercice.fromSnapshot(doc);
  }

  @override
  Future<void> createConnectedDevicesData(ConnectedDevices? data) {
    return connectedDevicesData.add({'data': data});
  }

  @override
  Stream<QuerySnapshot> readConnectedDevicesData() {
    return connectedDevicesData.snapshots();
  }

  @override
  Future<ConnectedDevices> updateConnectedDevicesData(String? docId) async {
    DocumentSnapshot doc = await connectedDevicesData.doc(docId).get();
    return ConnectedDevices.fromSnapshot(doc);
  }

  @override
  Future<ConnectedDevices> deleteConnectedDevicesData(String? docId) async {
    DocumentSnapshot doc = await connectedDevicesData.doc(docId).get();
    await connectedDevicesData.doc(docId).delete();
    return ConnectedDevices.fromSnapshot(doc);
  }

  @override
  Future<void> createSchoolLevelData(SchoolLevel? data) {
    return schoolLevelData.add({'data': data});
  }

  @override
  Stream<QuerySnapshot> readSchoolLevelData() {
    return schoolLevelData.snapshots();
  }

  @override
  Future<SchoolLevel> updateSchoolLevelData(String? docId) async {
    DocumentSnapshot doc = await schoolLevelData.doc(docId).get();
    return SchoolLevel.fromSnapshot(doc);
  }

  @override
  Future<SchoolLevel> deleteSchoolLevelData(String? docId) async {
    DocumentSnapshot doc = await schoolLevelData.doc(docId).get();
    await schoolLevelData.doc(docId).delete();
    return SchoolLevel.fromSnapshot(doc);
  }

  @override
  Stream<QuerySnapshot> readChallengeData() {
    return challengesData.snapshots();
  }
}
