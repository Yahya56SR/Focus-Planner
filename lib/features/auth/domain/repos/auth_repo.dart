import 'package:focus_planner/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> registerWithEmailPassword(
      String email, String password, String name);
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
  Future<AppUser?> loginWithGoogleCredentials();
  Future<AppUser?> loginWithPatreonCredentials();
}
