import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/auth/domain/repos/auth_repo.dart';
import 'package:focus_planner/features/database/data/firestore_db_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirestoreDbRepo firestoreDbRepo = FirestoreDbRepo();

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final existingUserStream = firestoreDbRepo.readUserData(userCredential.user!.uid);
      final existingUserSnapshot = await existingUserStream.first;

      if (existingUserSnapshot.docs.isNotEmpty) {
        final userData = existingUserSnapshot.docs.first.data() as Map<String, dynamic>;
        return AppUser(
          uid: userData['uid'],
          email: userData['email'],
          name: userData['name'],
        );
      }

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: userCredential.user!.displayName ?? '',
      );

      return user;
      
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

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
      );

      await firestoreDbRepo.createUserData(user);

      return user;
    } catch (e) {
      print('Registration failed: $e');
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
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/userinfo.email',
          'openid',
          'https://www.googleapis.com/auth/userinfo.profile',
        ],
      ).signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName!,
      );

      await firestoreDbRepo.createUserData(user);

      return user;
    } catch (e) {
      throw Exception('Failed to register using Google: $e');
    }
  }

  @override
  Future<AppUser?> loginWithGithubCredentials() async {
    final githubProvider = GithubAuthProvider();

    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithProvider(githubProvider);

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName!,
      );

      await firestoreDbRepo.createUserData(user);

      return user;
    } catch (e) {
      throw Exception("GitHub sign-in failed: $e");
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchKeepNotes() async {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }

    final googleUser = await GoogleSignIn().signIn();
    final authHeaders = await googleUser!.authHeaders;

    final response = await http.get(
      Uri.parse('https://keep.googleapis.com/v1/notes'),
      headers: authHeaders,
    );

    if (response.statusCode == 200) {
      final List<dynamic> notes = json.decode(response.body)['notes'];
      return notes.map((note) {
        final createdTime = note['createdTime'] ?? '';
        final datePart = createdTime.split('T')[0];
        final timePart = createdTime.split('T')[1]?.split('Z')[0] ?? '';
        final timeOfDay = TimeOfDay(
          hour: int.parse(timePart.split(':')[0]),
          minute: int.parse(timePart.split(':')[1]),
        );

        return {
          'taskTitle': note['title'] ?? '',
          'progDate': datePart,
          'progTime': timeOfDay,
        };
      }).toList();
    } else {
      throw Exception('Failed to load notes');
    }
  }
}
