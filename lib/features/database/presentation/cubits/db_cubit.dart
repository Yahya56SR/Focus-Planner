import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/database/data/firestore_db_repo.dart';
import 'package:focus_planner/features/database/presentation/cubits/db_states.dart';
import 'package:focus_planner/features/database/domain/entities/timetable.dart';
import 'package:focus_planner/features/database/domain/entities/task.dart';
import 'package:focus_planner/features/database/domain/entities/holiday.dart';
import 'package:focus_planner/features/database/domain/entities/exercice.dart';
import 'package:focus_planner/features/database/domain/entities/connected_devices.dart';
import 'package:focus_planner/features/database/domain/entities/school_level.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';

class DbCubit extends Cubit<DbStates> {
  final FirestoreDbRepo repository;

  DbCubit(this.repository) : super(DbInitial());

  Future<void> fetchTimetableData() async {
    try {
      emit(DbLoading());
      final data = await repository.readTimetableData().first;
      final timetables =
          data.docs.map((doc) => Timetable.fromSnapshot(doc)).toList();
      emit(DbData(timetables.map((e) => e.toJson()).toList()));
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> addTimetableData(Timetable data, AppUser currentUser) async {
    try {
      emit(DbLoading());
      await repository.createTimetableData(data, currentUser);
      await fetchTimetableData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> updateTimetableData(String docId) async {
    try {
      emit(DbLoading());
      final updatedData = await repository.updateTimetableData(docId);
      emit(DbUpdate(updatedData.toJson()));
      await fetchTimetableData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> deleteTimetableData(String docId) async {
    try {
      emit(DbLoading());
      final deletedData = await repository.deleteTimetableData(docId);
      emit(DbDelete(deletedData.toJson()));
      await fetchTimetableData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> fetchTaskData() async {
    try {
      emit(DbLoading());
      final data = await repository.readTaskData().first;
      final tasks = data.docs.map((doc) => Task.fromSnapshot(doc)).toList();
      emit(DbData(tasks.map((e) => e.toJson()).toList()));
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> addTaskData(Map<String, dynamic> data, String docId) async {
    try {
      emit(DbLoading());
      await repository.createTaskData(data, docId);
      await fetchTaskData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> updateTaskData(String docId) async {
    try {
      emit(DbLoading());
      final updatedData = await repository.updateTaskData(docId);
      emit(DbUpdate(updatedData.toJson()));
      await fetchTaskData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> deleteTaskData(String docId) async {
    try {
      emit(DbLoading());
      final deletedData = await repository.deleteTaskData(docId);
      emit(DbDelete(deletedData.toJson()));
      await fetchTaskData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> fetchHolidayData() async {
    try {
      emit(DbLoading());
      final data = await repository.readHolidayData().first;
      final holidays =
          data.docs.map((doc) => Holiday.fromSnapshot(doc)).toList();
      emit(DbData(holidays.map((e) => e.toJson()).toList()));
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> addHolidayData(String data) async {
    try {
      emit(DbLoading());
      await repository.createHolidayData(data);
      await fetchHolidayData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> updateHolidayData(String docId) async {
    try {
      emit(DbLoading());
      final updatedData = await repository.updateHolidayData(docId);
      emit(DbUpdate(updatedData.toJson()));
      await fetchHolidayData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> deleteHolidayData(String docId) async {
    try {
      emit(DbLoading());
      final deletedData = await repository.deleteHolidayData(docId);
      emit(DbDelete(deletedData.toJson()));
      await fetchHolidayData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> fetchExerciseData() async {
    try {
      emit(DbLoading());
      final data = await repository.readExerciseData().first;
      final exercises =
          data.docs.map((doc) => Exercice.fromSnapshot(doc)).toList();
      emit(DbData(exercises.map((e) => e.toJson()).toList()));
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> addExerciseData(String data) async {
    try {
      emit(DbLoading());
      await repository.createExerciseData(data);
      await fetchExerciseData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> updateExerciseData(String docId) async {
    try {
      emit(DbLoading());
      final updatedData = await repository.updateExerciseData(docId);
      emit(DbUpdate(updatedData.toJson()));
      await fetchExerciseData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> deleteExerciseData(String docId) async {
    try {
      emit(DbLoading());
      final deletedData = await repository.deleteExerciseData(docId);
      emit(DbDelete(deletedData.toJson()));
      await fetchExerciseData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> fetchConnectedDevicesData() async {
    try {
      emit(DbLoading());
      final data = await repository.readConnectedDevicesData().first;
      final devices =
          data.docs.map((doc) => ConnectedDevices.fromSnapshot(doc)).toList();
      emit(DbData(devices.map((e) => e.toJson()).toList()));
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> addConnectedDevicesData(String data) async {
    try {
      emit(DbLoading());
      await repository.createConnectedDevicesData(data);
      await fetchConnectedDevicesData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> updateConnectedDevicesData(String docId) async {
    try {
      emit(DbLoading());
      final updatedData = await repository.updateConnectedDevicesData(docId);
      emit(DbUpdate(updatedData.toJson()));
      await fetchConnectedDevicesData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> deleteConnectedDevicesData(String docId) async {
    try {
      emit(DbLoading());
      final deletedData = await repository.deleteConnectedDevicesData(docId);
      emit(DbDelete(deletedData.toJson()));
      await fetchConnectedDevicesData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> fetchSchoolLevelData() async {
    try {
      emit(DbLoading());
      final data = await repository.readSchoolLevelData().first;
      final levels =
          data.docs.map((doc) => SchoolLevel.fromSnapshot(doc)).toList();
      emit(DbData(levels.map((e) => e.toJson()).toList()));
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> addSchoolLevelData(String data) async {
    try {
      emit(DbLoading());
      await repository.createSchoolLevelData(data);
      await fetchSchoolLevelData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> updateSchoolLevelData(String docId) async {
    try {
      emit(DbLoading());
      final updatedData = await repository.updateSchoolLevelData(docId);
      emit(DbUpdate(updatedData.toJson()));
      await fetchSchoolLevelData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> deleteSchoolLevelData(String docId) async {
    try {
      emit(DbLoading());
      final deletedData = await repository.deleteSchoolLevelData(docId);
      emit(DbDelete(deletedData.toJson()));
      await fetchSchoolLevelData();
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }

  Future<void> fetchChallengeData() async {
    try {
      emit(DbLoading());
      final data = await repository.readChallengeData().first;
      emit(DbData(
          data.docs.map((e) => e.data() as Map<String, dynamic>).toList()));
    } catch (e) {
      emit(DbError(e.toString()));
    }
  }
}
