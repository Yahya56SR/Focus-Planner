import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/auth/domain/repos/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: '',
      );
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(
      String email, String password, String name) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
      );
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;

    if (firebaseUser == null) {
      return null;
    }
    return AppUser(
      uid: firebaseUser.uid,
      email: firebaseUser.email!,
      name: '',
    );
  }

  @override
  Future<AppUser?> loginWithGoogleCredentials() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return AppUser(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName!,
      );
    } catch (e) {
      throw Exception('Failed to register using Google: $e');
    }
  }
  @override
  Future<AppUser?> loginWithGithubCredentials() async {
    // Define GitHub's OAuth credentials
    final githubProvider = GithubAuthProvider();

    try {
      // Trigger the sign-in flow
      UserCredential userCredential = await firebaseAuth.signInWithProvider(githubProvider);
      
      // Get the signed-in user
      User? user = userCredential.user;
      return AppUser(uid: user!.uid, email: user.email!, name: user.displayName!);
    } catch (e) {
      throw Exception("GitHub sign-in failed: $e");
    }
  }
  
}
