import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/auth/domain/repos/auth_repo.dart';
import './auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit(this.authRepo) : super(AuthInitial());

  //check if user is already athenticated
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
          await authRepo.registerWithEmailPassword(name, email, password);
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

  // Register with Patreon credentials
  Future<void> registerPatreon() async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithPatreonCredentials();
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  //logout
  Future<void> logout() async {
    await authRepo.logout();
    emit(Unauthenticated());
  }
}
