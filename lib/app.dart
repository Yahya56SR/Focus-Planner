import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/Bloc/presentation/components/my_bloc_consumer.dart';
import 'package:focus_planner/features/Intro/presentation/pages/intro.dart';
import 'package:focus_planner/features/auth/data/firebase_auth_repo.dart';
import 'package:focus_planner/features/auth/domain/repos/auth_repo.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/features/auth/presentation/pages/auth_page.dart';
import 'package:focus_planner/features/import/xlsx/blocs/timetable_bloc.dart';
import 'package:focus_planner/features/timetable/presentation/pages/timetable_page.dart';
import 'package:focus_planner/themes/ligth_mode.dart';
import 'l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(widget.authRepo)..checkAuth(),
        ),
        BlocProvider(
          create: (context) => TimetableBloc(),
        ),
      ],
      child: MaterialApp(
        locale: _locale,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: {
          '/': (context) => MyBlocConsumer(setLocale: setLocale, currentLocale: _locale,),
          '/auth': (context) => AuthPage(setLocale: setLocale, currentLocale: _locale),
          '/into': (context) => IntroPage(currentLocale: _locale, setLocale: setLocale,),
          '/timetable': (context) => TimetablePage(currentLocale: _locale, setLocale: setLocale,)
        },
      ),
    );
  }
}
