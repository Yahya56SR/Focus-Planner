import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/Intro/presentation/pages/intro.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_states.dart';
import 'package:focus_planner/features/auth/presentation/pages/auth_page.dart';

class MyBlocConsumer extends StatelessWidget {
  const MyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, authState) {
        // Unauthenticated -> Auth Page
        if (authState is Unauthenticated) {
          return AuthPage();
        }

        // Authenticated -> Home Page
        if (authState is Authenticated) {
          return IntroPage();
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
    );
  }
}
