import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/data/firebase_auth_repo.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/auth/domain/repos/auth_repo.dart';
import 'package:focus_planner/features/auth/presentation/components/spacer.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/features/database/data/firestore_db_repo.dart';
import 'package:focus_planner/features/import/xlsx/extract_timetable.dart';
import 'package:focus_planner/l10n/app_localizations.dart';
import 'package:focus_planner/l10n/components/my_lang_changer.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  final Locale? currentLocale;
  final void Function(Locale)? setLocale;
  final AuthRepo authRepo = FirebaseAuthRepo();

  IntroPage({
    super.key,
    this.currentLocale,
    this.setLocale,
  });

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();
  AppUser? user;
  FirestoreDbRepo dbRepo = FirestoreDbRepo();

  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      dbRepo.getCurrentUserDoc(userId).then((userDoc) {
        setState(() {
          user = userDoc;
        });
      }).catchError((error) {
        // Handle error if needed
        debugPrint("Error fetching user: $error");
      });
    } else {
      debugPrint("No user is currently logged in.");
    }
  }

  void logout() {
    // auth cubit
    final AuthCubit authCubit = context.read<AuthCubit>();

    authCubit.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 150.0,
                child: PageView(
                  controller: _pageController,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Theme.of(context).colorScheme.surface,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bolt_outlined,
                            size: 125,
                          ),
                          AddSpace(
                            height: 22,
                          ),
                          Text(
                            AppLocalizations.of(context)!.hello,
                            style: Theme.of(context).textTheme.displayLarge,
                            textAlign: TextAlign.center,
                          ),
                          AddSpace(
                            height: 22,
                          ),
                          Text(
                            "${AppLocalizations.of(context)!.helloMessage} ${user?.name} ${AppLocalizations.of(context)!.helloMessageComplete}",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      letterSpacing: 3.25,
                                    ),
                            textAlign: TextAlign.justify,
                          ),
                          AddSpace(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.slogan,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  wordSpacing: 65,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          AddSpace(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () => _pageController.animateToPage(
                              1,
                              duration: Duration(milliseconds: 250),
                              curve: Curves.easeInOut,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Icon(
                                widget.currentLocale == Locale('en') ||
                                        widget.currentLocale == Locale('fr')
                                    ? Icons.arrow_circle_right_outlined
                                    : Icons.arrow_circle_left_outlined,
                                size: 100.0,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Theme.of(context).colorScheme.surface,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.today_rounded,
                            size: 125,
                          ),
                          AddSpace(
                            height: 22,
                          ),
                          Text(
                            AppLocalizations.of(context)!.timetableIntroTitle,
                            style: Theme.of(context).textTheme.displayLarge,
                            textAlign: TextAlign.center,
                          ),
                          AddSpace(
                            height: 22,
                          ),
                          Text(
                            AppLocalizations.of(context)!.timetableSubtitle,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      letterSpacing: 3.25,
                                    ),
                            textAlign: TextAlign.justify,
                          ),
                          AddSpace(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/timetable')
                                    .then((value) {
                              if (value == 'Timetable Completed') {
                                _pageController.animateToPage(
                                  2,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeInOut,
                                );
                              }
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.enter,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                    ),
                                    AddSpace(
                                      width: 10,
                                    ),
                                    Icon(
                                      widget.currentLocale == Locale('en') ||
                                              widget.currentLocale ==
                                                  Locale('fr')
                                          ? Icons.arrow_circle_right_outlined
                                          : Icons.arrow_circle_left_outlined,
                                      size: 50.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.choice,
                                ),
                                AddSpace(
                                  width: 4,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    // Implement import function here
                                    await extractAndSaveTimetable(context);
                                    _pageController.animateToPage(
                                      3,
                                      duration: Duration(milliseconds: 250),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.importXlsx,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          decoration: TextDecoration.underline,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Theme.of(context).colorScheme.surface,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.task_alt_outlined,
                            size: 125,
                          ),
                          AddSpace(
                            height: 22,
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              AppLocalizations.of(context)!.toDoTitle,
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          AddSpace(
                            height: 10,
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              AppLocalizations.of(context)!.toDoSubtitle,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          AddSpace(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/tasks'),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(22.0)),
                              child: Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 125,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 7,
                effect: ExpandingDotsEffect(),
                onDotClicked: (index) => _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeInOut),
              ),
            ],
          ),
          const Spacer(),
          MyLangChanger(
            setLocale: widget.setLocale,
            currentLocale: widget.currentLocale,
          )
        ],
      ),
    );
  }
}
