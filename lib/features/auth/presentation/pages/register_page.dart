import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/presentation/components/button.dart';
import 'package:focus_planner/features/auth/presentation/components/spacer.dart';
import 'package:focus_planner/features/auth/presentation/components/text_field.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  final void Function(Locale)? setLocale;

  const RegisterPage({
    super.key,
    required this.togglePages,
    this.setLocale
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with TickerProviderStateMixin {
  // text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
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
            AppLocalizations.of(context)!.enterName,
          ),
        ),
      );
    } else if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.enterEmail,
          ),
        ),
      );
    } else if (pw.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.enterPw,
          ),
        ),
      );
    } else if (email.isEmpty && pw.isEmpty && name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.enterNameEmailPw,
          ),
        ),
      );
    } else if (confirmPw != pw) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.pwNotMatch,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
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
                  padding: const EdgeInsets.only(top: 50.0),
                  child: GestureDetector(
                    onTap: () => _controller.reset(),
                    child: Lottie.asset(
                      'animations/Auth_Animation.json', 
                      repeat: false, 
                      width: 65,
                      height: 65,
                      fit: BoxFit.fill,
                      controller: _controller,
                      onLoaded: (composition) {
                        _controller
                          ..duration = composition.duration
                          ..forward();
                      },
                    ),
                  ),
                ),
                  
                    AddSpace(height: 50),
                  
                    // welcome text
                    Text(
                      AppLocalizations.of(context)!.createAccountTitle,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 25,
                          ),
                      textAlign: TextAlign.center,
                    ),
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
                        AppLocalizations.of(context)!.createAccount,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                  
                    AddSpace(height: 12),
                  
                    // username input
                    MyTextField(
                      controller: usernameController,
                      hintText: AppLocalizations.of(context)!.username,
                      obscureText: false,
                    ),
                  
                    AddSpace(
                      height: 10,
                    ),
                  
                    // email input
                    MyTextField(
                      hintText: AppLocalizations.of(context)!.email,
                      obscureText: false,
                      controller: emailController,
                    ),
                  
                    AddSpace(height: 10),
                  
                    // pw input
                    MyTextField(
                      hintText: AppLocalizations.of(context)!.password,
                      obscureText: true,
                      controller: pwController,
                    ),
                  
                    AddSpace(height: 10),
                  
                    // pw input
                    MyTextField(
                      hintText: AppLocalizations.of(context)!.pwConfirm,
                      obscureText: true,
                      controller: confirmPwController,
                    ),
                  
                    AddSpace(height: 20),
                  
                    // login button
                    MyButton(
                      onTap: register,
                      text: AppLocalizations.of(context)!.register,
                    ),
                  
                    AddSpace(height: 20),
                  
                    GestureDetector(
                      child: Text(
                        AppLocalizations.of(context)!.forgotPassword,
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
                            onTap: () => widget.setLocale!(Locale('en')),
                            child: Text(
                              AppLocalizations.of(context)!.en,
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
                            onTap: () => widget.setLocale!(Locale('ar')),
                            child: Text(
                              AppLocalizations.of(context)!.ar,
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
                            onTap: () => widget.setLocale!(Locale('fr')),
                            child: Text(
                              AppLocalizations.of(context)!.fr,
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