import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/Intro/presentation/pages/intro.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_states.dart';
import 'package:focus_planner/features/auth/presentation/pages/auth_page.dart';

class MyBlocConsumer extends StatelessWidget {
  final Locale? currentLocale;
  final void Function(Locale) setLocale;
  const MyBlocConsumer(
      {super.key, this.currentLocale, required this.setLocale});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, authState) {
        if (authState is Unauthenticated) {
          return AuthPage(
            setLocale: setLocale,
            currentLocale: currentLocale,
          );
        }

        if (authState is Authenticated) {
          return IntroPage(
            setLocale: setLocale,
            currentLocale: currentLocale,
          );
        }

        if (authState is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }

        return const Scaffold(
          body: Center(
            child: Text('Unknown state'),
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
