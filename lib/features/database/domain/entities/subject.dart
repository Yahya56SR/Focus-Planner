import 'package:flutter/material.dart';
import 'package:focus_planner/l10n/app_localizations.dart';

class Subject {
  final String? subId;
  final String? subName;
  final String? thumbPath;
  final bool? isLitter;
  final bool? isScience;
  final String? subLang;
  final List<String>? subLessons;

  Subject({
    this.subId,
    this.subName,
    this.thumbPath,
    this.subLang,
    this.subLessons,
    this.isLitter = false,
    this.isScience = false,
  });

  List<Subject> getSubjects(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;

  final subjects = [
    Subject(
      subId: '1',
      subName: l10n.mathematics,
      thumbPath: 'assets/subjects/math_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '2',
      subName: l10n.historyGeography,
      thumbPath: 'assets/subjects/geo_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '3',
      subName: l10n.scienceLife,
      thumbPath: 'assets/subjects/svt_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '4',
      subName: l10n.arabic,
      thumbPath: 'assets/subjects/arabic_thumb.png',
      subLang: l10n.arabic,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '5',
      subName: l10n.physics,
      thumbPath: 'assets/subjects/physics_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '6',
      subName: l10n.chemistry,
      thumbPath: 'assets/subjects/chemistry_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '7',
      subName: l10n.english,
      thumbPath: 'assets/subjects/english_thumb.png',
      subLang: l10n.english,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '8',
      subName: l10n.french,
      thumbPath: 'assets/subjects/french_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '9',
      subName: l10n.islamicEducation,
      thumbPath: 'assets/subjects/islamic_ed_thumb.png',
      subLang: l10n.arabic,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '10',
      subName: l10n.philosophy,
      thumbPath: 'assets/subjects/philosophy_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '11',
      subName: l10n.physicalEducation,
      thumbPath: 'assets/subjects/sport_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: false,
      isScience: false,
    ),
    Subject(
      subId: '12',
      subName: l10n.arts,
      thumbPath: 'assets/subjects/art_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
  ];

  return subjects;
}

Subject? getSubjectById(BuildContext context, String subId) {
  final l10n = AppLocalizations.of(context)!;

  final subjects = [
    Subject(
      subId: '1',
      subName: l10n.mathematics,
      thumbPath: 'assets/subjects/math_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '2',
      subName: l10n.historyGeography,
      thumbPath: 'assets/subjects/geo_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '3',
      subName: l10n.scienceLife,
      thumbPath: 'assets/subjects/svt_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '4',
      subName: l10n.arabic,
      thumbPath: 'assets/subjects/arabic_thumb.png',
      subLang: l10n.arabic,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '5',
      subName: l10n.physics,
      thumbPath: 'assets/subjects/physics_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '6',
      subName: l10n.chemistry,
      thumbPath: 'assets/subjects/chemistry_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '7',
      subName: l10n.english,
      thumbPath: 'assets/subjects/english_thumb.png',
      subLang: l10n.english,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '8',
      subName: l10n.french,
      thumbPath: 'assets/subjects/french_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '9',
      subName: l10n.islamicEducation,
      thumbPath: 'assets/subjects/islamic_ed_thumb.png',
      subLang: l10n.arabic,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '10',
      subName: l10n.philosophy,
      thumbPath: 'assets/subjects/philosophy_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '11',
      subName: l10n.physicalEducation,
      thumbPath: 'assets/subjects/sport_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: false,
      isScience: false,
    ),
    Subject(
      subId: '12',
      subName: l10n.arts,
      thumbPath: 'assets/subjects/art_thumb.png',
      subLang: l10n.french,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
  ];

  return subjects.firstWhere(
    (subject) => subject.subId == subId,
    orElse: () => Subject(
      subId: '',
      subName: '',
      thumbPath: '',
      subLang: '',
      subLessons: [],
      isLitter: false,
      isScience: false,
    ),
  );
}
}
