import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  void logout() {
    // auth cubit
    final AuthCubit authCubit = context.read<AuthCubit>();

    authCubit.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: GestureDetector(
              onTap: logout,
              child: Icon(Icons.logout),
            ),
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
