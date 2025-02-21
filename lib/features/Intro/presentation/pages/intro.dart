import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_planner/features/auth/presentation/components/spacer.dart';
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:focus_planner/features/import/xlsx/blocs/timetable_event.dart';
import 'package:focus_planner/features/import/xlsx/blocs/timetable_state.dart';
import 'package:focus_planner/features/overall%20components/my_lang_changer.dart';
import 'package:focus_planner/l10n/app_localizations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:focus_planner/features/import/xlsx/blocs/timetable_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  final Locale? currentLocale;
  final void Function(Locale)? setLocale;
  const IntroPage({
    super.key,
    this.currentLocale,
    this.setLocale,
  });

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();

  void logout() {
    // auth cubit
    final AuthCubit authCubit = context.read<AuthCubit>();

    authCubit.logout();
  }

  void importExcelTimetable() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null && result.files.single.bytes != null) {
      final filePath = result.files.single.bytes!;
      final TimetableBloc timetableBloc = context.read<TimetableBloc>();
      timetableBloc.add(LoadTimetable(filePath.toString()));

      timetableBloc.stream.listen((state) {
        if (state is TimetableLoaded) {
          if (state.entries.isNotEmpty) {
            print('Timetable found:');
            for (var entry in state.entries) {
              print(entry);
            }
          } else {
            print('No timetable found.');
          }
        } else if (state is TimetableError) {
          print('Error loading timetable: ${state.message}');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 650.0,
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
                            AppLocalizations.of(context)!.helloMessage,
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
                                Icons.arrow_circle_right_outlined,
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
                            onTap:
                                importExcelTimetable, // Implement import function here
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
                                      AppLocalizations.of(context)!.importXlsx,
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
                                      Icons.arrow_circle_right_outlined,
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
                                  onTap:
                                      importExcelTimetable, // Implement import function here
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
                      color: Colors.blue,
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
