import 'package:flutter/material.dart';
import 'package:focus_planner/features/auth/presentation/components/spacer.dart';

class MyLangChanger extends StatefulWidget {
  final void Function(Locale)? setLocale;
  final Locale? currentLocale;

  const MyLangChanger({
    super.key,
    required this.setLocale,
    required this.currentLocale,
  });

  @override
  State<MyLangChanger> createState() => _MyLangChangerState();
}

class _MyLangChangerState extends State<MyLangChanger> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => widget.setLocale!(Locale('en')),
            child: Text(
              'English',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: widget.currentLocale == Locale('en')
                        ? FontWeight.bold
                        : null,
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
            child: Text('عربي',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: widget.currentLocale == Locale('ar')
                          ? FontWeight.bold
                          : null,
                    )),
          ),
          AddSpace(width: 5),
          Icon(
            Icons.radio_button_checked_sharp,
            size: 20,
          ),
          AddSpace(width: 5),
          GestureDetector(
            onTap: () => widget.setLocale!(Locale('fr')),
            child: Text('Français',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: widget.currentLocale == Locale('fr')
                          ? FontWeight.bold
                          : null,
                    )),
          ),
        ],
      ),
    );
  }
}
