import 'package:flutter/material.dart';
import 'package:focus_planner/l10n/app_localizations.dart';

class Subject {
  final String? subId;
  final String? subName;
  final String? thumbPath;
  final bool isLitter;
  final bool isScience;
  final String? subLang;
  final List<String>? subLessons;

  Subject({
    this.subId,
    this.subName,
    this.thumbPath,
    this.subLang,
    this.subLessons,
    required this.isLitter,
    required this.isScience,
  });
}

List<Subject> getSubjects(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;

  return [
    Subject(
      subId: '1',
      subName: l10n.subjectMathematics,
      thumbPath: 'assets/subjects/math_thumb.png',
      subLang: l10n.langFrench,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '2',
      subName: l10n.subjectHistoryGeography,
      thumbPath: 'assets/subjects/history_geo_thumb.png',
      subLang: l10n.langFrench,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '3',
      subName: l10n.subjectScienceLife,
      thumbPath: 'assets/subjects/svt_thumb.png',
      subLang: l10n.langFrench,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '4',
      subName: l10n.langArabic,
      thumbPath: 'assets/subjects/arabic_thumb.png',
      subLang: l10n.langArabic,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '5',
      subName: l10n.subjectPhysics,
      thumbPath: 'assets/subjects/physics_thumb.png',
      subLang: l10n.langFrench,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '6',
      subName: l10n.subjectChemistry,
      thumbPath: 'assets/subjects/chemistry_thumb.png',
      subLang: l10n.langFrench,
      subLessons: [],
      isLitter: false,
      isScience: true,
    ),
    Subject(
      subId: '7',
      subName: l10n.langEnglish,
      thumbPath: 'assets/subjects/english_thumb.png',
      subLang: l10n.langEnglish,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '8',
      subName: l10n.langFrench,
      thumbPath: 'assets/subjects/french_thumb.png',
      subLang: l10n.langFrench,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '9',
      subName: l10n.subjectIslamicEducation,
      thumbPath: 'assets/subjects/islamic_ed_thumb.png',
      subLang: l10n.langArabic,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '10',
      subName: l10n.subjectPhilosophy,
      thumbPath: 'assets/subjects/philosophy_thumb.png',
      subLang: l10n.langFrench,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
    Subject(
      subId: '11',
      subName: l10n.subjectPhysicalEducation,
      thumbPath: 'assets/subjects/sport_thumb.png',
      subLang: l10n.langFrench,
      subLessons: [],
      isLitter: false,
      isScience: false,
    ),
    Subject(
      subId: '12',
      subName: l10n.subjectArts,
      thumbPath: 'assets/subjects/art_thumb.png',
      subLang: l10n.langFrench,
      subLessons: [],
      isLitter: true,
      isScience: false,
    ),
  ];
}