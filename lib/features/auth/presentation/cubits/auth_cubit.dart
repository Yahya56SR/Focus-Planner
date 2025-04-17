import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/auth/domain/repos/auth_repo.dart';
import './auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit(this.authRepo) : super(AuthInitial()) {
    _initializeAuth();
  }

  void _initializeAuth() async {
    emit(AuthLoading());
    try {
      final user = await authRepo.getCurrentUser();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  //check if user is already authenticated
  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();

    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  //get current user
  AppUser? get currentUser => _currentUser;

  //login with email + pw
  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithEmailPassword(email, password);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  //register with email + pw
  Future<void> register(String name, String email, String password) async {
    try {
      emit(AuthLoading());
      final user =
          await authRepo.registerWithEmailPassword(email, password, name);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  //register with google credential
  Future<void> registerGoogle() async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithGoogleCredentials();
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  // Register with Github credentials
  Future<void> registerGithub() async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithGithubCredentials();
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError('Authentication Failed $e'));
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  // logout
  Future<void> logout() async {
    await authRepo.logout();
    emit(Unauthenticated());
  }

  // fetch keep notes
  Future<List<Map<String, dynamic>>> fetchKeepNotes() async {
    emit(AuthLoading());
    try {
      final notes = await authRepo.fetchKeepNotes();
      emit(Authenticated(_currentUser!));
      return notes;
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
      return [];
    }
  }
}
