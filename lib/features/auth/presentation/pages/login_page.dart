import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/presentation/components/button.dart';
import 'package:focus_planner/features/auth/presentation/components/spacer.dart';
import 'package:focus_planner/features/auth/presentation/components/text_field.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  final void Function(Locale)? setLocale;
  final Locale? currentLocale;

  const LoginPage({
    super.key,
    required this.togglePages,
    this.setLocale,
    this.currentLocale,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

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
    _controller.dispose();
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: GestureDetector(
                      onTap: () => _controller.toggle(),
                      child: Lottie.asset(
                        'animations/Auth_Animation.json', 
                        repeat: false, 
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                        controller: _controller,
                        onLoaded: (composition) {
                          _controller
                            ..duration = Duration(seconds: 2)
                            ..forward();
                        },
                      ),
                    ),
                  ),
                ),

                AddSpace(height: 12),

                // welcome text
                Text(
                  AppLocalizations.of(context)!.signInTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 25,
                      ),
                  textAlign: TextAlign.center,
                ),
                AddSpace(
                  height: 10,
                ),
               

                AddSpace(height: 25),
                // email input
                MyTextField(
                  controller: emailController,
                  hintText: AppLocalizations.of(context)!.idOrEmail,
                  obscureText: false,
                ),

                AddSpace(
                  height: 10,
                ),

                // pw input
                MyTextField(
                  hintText: AppLocalizations.of(context)!.password,
                  obscureText: true,
                  controller: pwController,
                ),

                AddSpace(height: 20),

                // login button
                MyButton(
                  onTap: login,
                  text: AppLocalizations.of(context)!.signIn,
                ),

                AddSpace(height: 20),

                // register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.selectionCreateAccount,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        AppLocalizations.of(context)!.register,
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
                Text(AppLocalizations.of(context)!.selectionCreateAccount),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    AddSpace(width: 10),
                    Text(AppLocalizations.of(context)!.and),
                    AddSpace(width: 10),
                    Text(
                      AppLocalizations.of(context)!.termsOfUse,
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
                      GestureDetector(
                        onTap: () => widget.setLocale!(Locale('en')),
                        child: Text(
                          'English',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: widget.currentLocale == Locale('en') ? FontWeight.bold : null,
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
                        onTap: () => widget.setLocale!(Locale('en')),
                        child: Text('عربي',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: widget.currentLocale == Locale('ar') ? FontWeight.bold : null,
                            )
                          ),
                      ),
                      AddSpace(width: 5),
                          Icon(
                            Icons.radio_button_checked_sharp,
                            size: 20,
                          ),
                          AddSpace(width: 5),
                          GestureDetector(
                            onTap: () => widget.setLocale!(Locale('fr')),
                            child: Text(
                              'Français',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: widget.currentLocale == Locale('fr') ? FontWeight.bold : null,
                              )
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
