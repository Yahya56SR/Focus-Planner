import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/auth/domain/repos/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Patreon OAuth credentials
  static const String patreonClientId =
      'mimAaOCu6TLFWILyboBaWs0S6Mayu0YXVEBTKH0n-yvxZc5qNw-AABdLKq-KquHY';
  static const String patreonClientSecret =
      '-lTthBVPx64ZzASOs_lRycs1e9Z6exKjjipJNJx7KkwgbR9wQMRsxc6UpY2sLPBg';
  static const String patreonRedirectUri =
      'https://com.nexordev.focusplanner://login-callback'; // e.g., https://yourapp.com/auth/patreon/callback

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
  Future<AppUser?> loginWithPatreonCredentials() async {
    try {
      // Step 1: Redirect user to Patreon for authorization
      const scope = 'identity identity[email]';
      final authUrl =
          'https://www.patreon.com/oauth2/authorize?response_type=code&client_id=$patreonClientId&redirect_uri=$patreonRedirectUri&scope=$scope';

      // Open the URL in a WebView and capture the callback
      final code = await _launchPatreonLoginWebView(authUrl);

      if (code == null) {
        throw Exception('Authorization code not found');
      }

      // Step 2: Exchange the authorization code for an access token
      final accessToken = await _exchangeCodeForToken(code);

      if (accessToken == null) {
        throw Exception('Failed to obtain access token');
      }

      // Step 3: Fetch user data using the access token
      final userData = await _fetchPatreonUserData(accessToken);

      if (userData == null) {
        throw Exception('Failed to fetch user data from Patreon');
      }

      // Step 4: Create a Firebase user with Patreon credentials
      final credential = OAuthProvider('patreon.com').credential(
        accessToken: accessToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return AppUser(
        uid: userCredential.user!.uid,
        email: userData['email'],
        name: userData['full_name'],
      );
    } catch (e) {
      throw Exception('Failed to register using Patreon: $e');
    }
  }

  // Helper method to launch Patreon login in a WebView and capture the authorization code
  Future<String?> _launchPatreonLoginWebView(String authUrl) async {
    Completer<String?> completer = Completer();

    InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(authUrl)),
      onLoadStop: (controller, url) async {
        if (url.toString().startsWith(patreonRedirectUri)) {
          // Extract the authorization code from the URL
          final uri = Uri.parse(url.toString());
          final code = uri.queryParameters['code'];

          if (code != null) {
            completer.complete(code);
          } else {
            completer.complete(null);
          }
        }
      },
    );

    return completer.future;
  }

  // Helper method to exchange the authorization code for an access token
  Future<String?> _exchangeCodeForToken(String code) async {
    final tokenUrl = 'https://www.patreon.com/api/oauth2/token';

    final response = await http.post(
      Uri.parse(tokenUrl),
      body: {
        'code': code,
        'grant_type': 'authorization_code',
        'client_id': patreonClientId,
        'client_secret': patreonClientSecret,
        'redirect_uri': patreonRedirectUri,
      },
    );

    if (response.statusCode == 200) {
      final tokenData = jsonDecode(response.body);
      return tokenData['access_token'];
    } else {
      throw Exception('Failed to obtain access token: ${response.body}');
    }
  }

  // Helper method to fetch user data from Patreon
  Future<Map<String, dynamic>?> _fetchPatreonUserData(
      String accessToken) async {
    final userUrl =
        'https://www.patreon.com/api/oauth2/v2/identity?fields[user]=email,full_name';

    final response = await http.get(
      Uri.parse(userUrl),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final userData = jsonDecode(response.body);
      return userData['data'];
    } else {
      throw Exception('Failed to fetch user data: ${response.body}');
    }
  }
}
