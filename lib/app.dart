import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/Intro/presentation/pages/intro.dart';
import 'package:focus_planner/features/auth/data/firebase_auth_repo.dart';
import 'package:focus_planner/features/auth/domain/repos/auth_repo.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_states.dart';
import 'package:focus_planner/features/auth/presentation/pages/auth_page.dart';
import 'package:focus_planner/themes/ligth_mode.dart';

import 'l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  // auth repo
  final AuthRepo authRepo = FirebaseAuthRepo();

  MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(widget.authRepo)..checkAuth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, authState) {
            // Unauthenticated -> Auth Page
            if (authState is Unauthenticated) {
              return const AuthPage();
            }

            // Authenticated -> Home Page
            if (authState is Authenticated) {
              return const IntroPage();
            }

            // loading
            else if (authState is AuthLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }

            // default case
            return const Scaffold(
              body: Center(
                child: Text('Unknown state'),
              ),
            );
          },
          listener: (BuildContext context, state) {},
        ),
      ),
    );
  }
}