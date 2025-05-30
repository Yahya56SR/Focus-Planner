import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/Intro/presentation/pages/intro.dart';
import 'package:focus_planner/features/auth/data/firebase_auth_repo.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/auth/domain/repos/auth_repo.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/features/auth/presentation/pages/auth_page.dart';
import 'package:focus_planner/features/dashboard/presentation/pages/dash_page.dart';
import 'package:focus_planner/features/database/data/firestore_db_repo.dart';
import 'package:focus_planner/features/database/presentation/cubits/db_cubit.dart';
import 'package:focus_planner/features/database/presentation/pages/tasks/tasks_page.dart';
import 'package:focus_planner/features/database/presentation/pages/timetables/timetable_page.dart';
import 'package:focus_planner/themes/light_mode.dart';
import 'l10n/app_localizations.dart';

class FocusPlannerApp extends StatefulWidget {
  final AuthRepo authRepo = FirebaseAuthRepo();

  FocusPlannerApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FocusPlannerAppState createState() => _FocusPlannerAppState();
}

class _FocusPlannerAppState extends State<FocusPlannerApp> {
  AppUser? user;
  Locale _locale = const Locale('en');

  @override
  void initState() {
    super.initState();
    widget.authRepo.getCurrentUser().then((onValue) {
      setState(() {
        user = onValue;
      });
    });
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(widget.authRepo)..checkAuth(),
        ),
        BlocProvider<DbCubit>(
          create: (context) => DbCubit(FirestoreDbRepo()),
        ),
      ],
      child: MaterialApp(
        locale: _locale,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: {
          '/': (context) => DashboardPage(),
          '/auth': (context) => AuthPage(
                setLocale: setLocale,
                currentLocale: _locale,
              ),
          '/intro': (context) => IntroPage(
                currentLocale: _locale,
                setLocale: setLocale,
              ),
          '/timetable': (context) => TimetablePage(
                currentLocale: _locale,
                setLocale: setLocale,
              ),
          '/tasks': (context) => const TasksPage(),
          '/dashboard': (context) => const DashboardPage(),
        },
      ),
    );
  }
}
