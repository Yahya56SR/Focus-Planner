import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/data/firebase_auth_repo.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_states.dart';
import 'package:focus_planner/features/database/data/firestore_db_repo.dart';
import 'package:focus_planner/features/database/presentation/cubits/db_cubit.dart';
import 'package:focus_planner/features/database/presentation/cubits/db_states.dart';

class MyBlocConsumer extends StatelessWidget {
  const MyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(FirebaseAuthRepo()),
        ),
        BlocProvider<DbCubit>(
          create: (context) => DbCubit(FirestoreDbRepo()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                // Show an error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.message}')),
                );
              } else if (state is Authenticated) {
                // Display information about the authenticated user
                Navigator.of(context).pushNamed('/intro',
                    arguments: BlocProvider.of<DbCubit>(context));
              } else if (state is Unauthenticated) {
                Navigator.of(context).pushNamed('/auth',
                    arguments: BlocProvider.of<DbCubit>(context));
              }
            },
          ),
          BlocListener<DbCubit, DbStates>(
            listener: (context, state) {
              if (state is DbLoading) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        fill: 1,
                      ),
                      Text('The database is loading...'),
                    ],
                  ),
                  duration: Duration(seconds: 2),
                ));
              } else if (state is DbCreate) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        fill: 1,
                      ),
                      Text('The Data was created successfully'),
                    ],
                  ),
                  duration: Duration(seconds: 2),
                ));
              } else if (state is DbDelete) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        fill: 1,
                      ),
                      Text('The data was deleted successfully...'),
                    ],
                  ),
                  duration: Duration(seconds: 2),
                ));
              } else if (state is DbUpdate) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        fill: 1,
                      ),
                      Text('The database was updated successfully...'),
                    ],
                  ),
                  duration: Duration(seconds: 2),
                ));
              } else if (state is DbError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        fill: 1,
                      ),
                      Text(
                          'We have an error while updating database, ${state.message}'),
                    ],
                  ),
                  duration: Duration(seconds: 2),
                ));
              } else if (state is DbData) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        fill: 1,
                      ),
                      Text('The database was loaded successfully...'),
                    ],
                  ),
                  duration: Duration(seconds: 2),
                ));
              }
            },
          ),
        ],
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              // Show a loading indicator
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuthInitial) {
              // Handle the AuthInitial state
              return const Scaffold(
                body: Center(
                  child: Text('Initializing authentication...'),
                ),
              );
            } else {
              // Default UI for unknown state
              print(state);
              return const Scaffold(
                body: Center(
                  child: Text('Please wait...'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
