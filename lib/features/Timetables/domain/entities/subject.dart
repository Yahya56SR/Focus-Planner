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
