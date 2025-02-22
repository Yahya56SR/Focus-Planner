import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/database/domain/entities/timetable.dart';
import 'package:focus_planner/features/database/presentation/cubits/db_states.dart';
import 'package:focus_planner/features/timetable/domain/repo/timetable_repo.dart';

class DbCubit extends Cubit<DbStates> {
  final TimetableRepo repository;

  DbCubit(super.initialState, this.repository);

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
}
