import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/presentation/components/button.dart';
import 'package:focus_planner/features/auth/presentation/components/spacer.dart';
import 'package:focus_planner/features/auth/presentation/components/text_field.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import '../../../l10n/app_localizations.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;

  const RegisterPage({
    super.key,
    required this.togglePages,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();
  // ignore: unused_field
  Locale _currentLocale = Locale('en', '');

  void _changeLanguage(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
  }

  void register() {
    // prepare email & pw
    final name = usernameController.text;
    final String email = emailController.text;
    final String pw = pwController.text;
    final String confirmPw = confirmPwController.text;

    // auth cubit
    final authCubit = context.read<AuthCubit>();

    // ensure that the email & pw fields are not empty
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        pw.isNotEmpty &&
        confirmPw == pw) {
      // login
      authCubit.register(name, email, pw);
    } else if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.translate('enterName'),
          ),
        ),
      );
    } else if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.translate('enterEmail'),
          ),
        ),
      );
    } else if (pw.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.translate('enterPw'),
          ),
        ),
      );
    } else if (email.isEmpty && pw.isEmpty && name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.translate('enterNameEmailPw'),
          ),
        ),
      );
    } else if (confirmPw != pw) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.translate('pwNotMatch'),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    pwController.dispose();
    confirmPwController.dispose();
    super.dispose();
  }

  void registerGoogle() {
    // auth cubit
    final authCubit = context.read<AuthCubit>();

    // register
    authCubit.registerGoogle();
  }

  void registerPatreon() {
    // auth cubit
    final authCubit = context.read<AuthCubit>();

    // register
    authCubit.registerPatreon();
  }

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    // SCAFFOLD
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
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Icon(
                    Icons.lock_open_rounded,
                    size: 80,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),

                AddSpace(height: 50),

                // welcome text
                Text(
                  AppLocalizations.of(context)!.translate('createAccountTitle'),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 25,
                      ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  AppLocalizations.of(context)!.translate('createAccountSubtitle'),
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),

                AddSpace(height: 12),

                // username input
                MyTextField(
                  controller: usernameController,
                  hintText: AppLocalizations.of(context)!.translate('username'),
                  obscureText: false,
                ),

                AddSpace(
                  height: 10,
                ),

                // email input
                MyTextField(
                  hintText: AppLocalizations.of(context)!.translate('email'),
                  obscureText: false,
                  controller: emailController,
                ),

                AddSpace(height: 10),

                // pw input
                MyTextField(
                  hintText: AppLocalizations.of(context)!.translate('password'),
                  obscureText: true,
                  controller: pwController,
                ),

                AddSpace(height: 10),

                // pw input
                MyTextField(
                  hintText: AppLocalizations.of(context)!.translate('pwConfirm'),
                  obscureText: true,
                  controller: confirmPwController,
                ),

                AddSpace(height: 20),

                // login button
                MyButton(
                  onTap: register,
                  text: AppLocalizations.of(context)!.translate('register'),
                ),

                AddSpace(height: 20),

                GestureDetector(
                  child: Text(
                    AppLocalizations.of(context)!.translate('forgotPassword'),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),

                AddSpace(height: 10),

                // Other ways to sign in
                Divider(),

                AddSpace(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: registerGoogle,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'images/google_logo.png',
                          color: Theme.of(context).colorScheme.onSecondary,
                          scale: 3,
                        ),
                      ),
                    ),
                    AddSpace(
                      width: 25,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'images/apple_logo.png',
                          color: Theme.of(context).colorScheme.onSecondary,
                          scale: 3,
                        ),
                      ),
                    ),
                    AddSpace(
                      width: 25,
                    ),
                    InkWell(
                      onTap: registerPatreon,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'images/patreon_logo.png',
                          color: Theme.of(context).colorScheme.onSecondary,
                          scale: 3,
                        ),
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
                      GestureDetector(
                        onTap: () => _changeLanguage(Locale('en', '')),
                        child: Text(
                          AppLocalizations.of(context)!.translate('en'),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      AddSpace(width: 5),
                      Icon(
                        Icons.radio_button_checked_sharp,
                        size: 20,
                      ),
                      AddSpace(width: 5),
                      GestureDetector(
                        onTap: () => _changeLanguage(Locale('ar', '')),
                        child: Text(
                          AppLocalizations.of(context)!.translate('ar'),
                          style: Theme.of(context).textTheme.bodyMedium
                        ),
                      ),
                      AddSpace(width: 5),
                      Icon(
                        Icons.radio_button_checked_sharp,
                        size: 20,
                      ),
                      AddSpace(width: 5),
                      GestureDetector(
                        onTap: () => _changeLanguage(Locale('fr', '')),
                        child: Text(
                          AppLocalizations.of(context)!.translate('fr'),
                          style: Theme.of(context).textTheme.bodyMedium
                        ),
                      ),
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