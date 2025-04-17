import 'package:flutter/material.dart';
import 'package:focus_planner/features/auth/presentation/pages/login_page.dart';
import 'package:focus_planner/features/auth/presentation/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  final void Function(Locale)? setLocale;
  final Locale? currentLocale;

  const AuthPage({
    super.key,
    required this.setLocale,
    required this.currentLocale,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initially show login page
  bool showLoginPage = true;

  // toggle between pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage == true) {
      return LoginPage(
        togglePages: togglePages,
        setLocale: widget.setLocale,
        currentLocale: widget.currentLocale,
      );
    } else {
      return RegisterPage(
        togglePages: togglePages,
        setLocale: widget.setLocale,
        currentLocale: widget.currentLocale,
      );
    }
  }
}
