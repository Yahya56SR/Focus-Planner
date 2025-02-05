import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/presentation/components/button.dart';
import 'package:focus_planner/features/auth/presentation/components/spacer.dart';
import 'package:focus_planner/features/auth/presentation/components/text_field.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;

  const LoginPage({
    super.key,
    required this.togglePages,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  void login() {
    // prepare email & pw
    final String email = emailController.text;
    final String pw = pwController.text;

    // auth cubit
    final authCubit = context.read<AuthCubit>();

    // ensure that the email & pw fields are not empty
    if (email.isNotEmpty && pw.isNotEmpty) {
      // login
      authCubit.login(email, pw);
    } else if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please Enter Email',
          ),
        ),
      );
    } else if (pw.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please Enter Password',
          ),
        ),
      );
    } else if (email.isEmpty && pw.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please Enter Both Email & Password',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    // S C A F F O L D
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // B O D Y
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Icon(
                    Icons.lock_open_rounded,
                    size: 80,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),

                AddSpace(height: 50),

                // welcome text
                Text(
                  'Sign In to your account',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 25,
                      ),
                  textAlign: TextAlign.center,
                ),
                AddSpace(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'or',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        ' Create an account ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Text(
                      'if you do not have one',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),

                AddSpace(height: 25),
                // email input
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                AddSpace(
                  height: 10,
                ),

                // pw input
                MyTextField(
                  hintText: 'Password',
                  obscureText: true,
                  controller: pwController,
                ),

                AddSpace(height: 20),

                // login button
                MyButton(
                  onTap: login,
                  text: 'Login',
                ),

                AddSpace(height: 20),

                // register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Or, if you have already an account ; ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        'Register Now',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),

                AddSpace(height: 20),

                // agree
                Text('If you create an account, you agree our'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    AddSpace(width: 10),
                    Text('&'),
                    AddSpace(width: 10),
                    Text(
                      'Terms of Use',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ],
                ),

                const Spacer(),

                // lang changer
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'English',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      AddSpace(width: 5),
                      Icon(
                        Icons.radio_button_checked_sharp,
                        size: 20,
                      ),
                      AddSpace(width: 5),
                      Text('عربي',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
