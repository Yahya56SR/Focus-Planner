import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_states.dart';

class MyBlocConsumer extends StatelessWidget {
  const MyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
          builder: (context, authState) {
            // Unauthenticated -> Auth Page
            if (authState is Unauthenticated) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, '/auth');
              });
            }

            // Authenticated -> Home Page
            if (authState is Authenticated) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, '/intro');
              });
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