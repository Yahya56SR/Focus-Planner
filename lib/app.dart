import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/Intro/presentation/pages/intro.dart';
import 'package:focus_planner/features/auth/data/firebase_auth_repo.dart';
import 'package:focus_planner/features/auth/domain/repos/auth_repo.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_states.dart';
import 'package:focus_planner/themes/ligth_mode.dart';
import 'features/auth/presentation/pages/auth_page.dart';
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
  Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(widget.authRepo)..checkAuth(),
      child: MaterialApp(
        locale: _locale,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, authState) {
            // Unauthenticated -> Auth Page
            if (authState is Unauthenticated) {
              return AuthPage(
                setLocale: setLocale,
                currentLocale: _locale,
              );
            }

            // Authenticated -> Home Page
            if (authState is Authenticated) {
              return IntroPage(
                setLocale: setLocale,
                currentLocale: _locale,
              );
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
