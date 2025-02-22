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

List<Subject> subjects = [
  Subject(
    subId: '1',
    subName: 'Mathematics',
    thumbPath: 'path/to/math_thumb.png',
    subLang: 'English',
    subLessons: ['Algebra', 'Geometry', 'Calculus'],
    isLitter: false,
    isScience: true,
  ),
  Subject(
    subId: '2',
    subName: 'History',
    thumbPath: 'path/to/history_thumb.png',
    subLang: 'English',
    subLessons: ['Ancient', 'Medieval', 'Modern'],
    isLitter: true,
    isScience: false,
  ),
  Subject(
    subId: '3',
    subName: 'Biology',
    thumbPath: 'path/to/biology_thumb.png',
    subLang: 'English',
    subLessons: ['Botany', 'Zoology', 'Genetics'],
    isLitter: false,
    isScience: true,
  ),
  Subject(
    subId: '4',
    subName: 'Literature',
    thumbPath: 'path/to/literature_thumb.png',
    subLang: 'English',
    subLessons: ['Poetry', 'Prose', 'Drama'],
    isLitter: true,
    isScience: false,
  ),
  Subject(
    subId: '5',
    subName: 'Physics',
    thumbPath: 'path/to/physics_thumb.png',
    subLang: 'English',
    subLessons: ['Mechanics', 'Optics', 'Thermodynamics'],
    isLitter: false,
    isScience: true,
  ),
  Subject(
    subId: '6',
    subName: 'Chemistry',
    thumbPath: 'path/to/chemistry_thumb.png',
    subLang: 'English',
    subLessons: ['Organic', 'Inorganic', 'Physical'],
    isLitter: false,
    isScience: true,
  ),
];
