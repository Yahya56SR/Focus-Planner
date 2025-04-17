import 'package:focus_planner/features/enum/country.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SchoolLevel {
  final Country country;
  final String schoolLevel;
  final List<String> subjects;

  SchoolLevel({
    required this.country,
    required this.schoolLevel,
    required this.subjects,
  });

  factory SchoolLevel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return SchoolLevel(
      country: Country.values[data['country']],
      schoolLevel: data['schoolLevel'],
      subjects: List<String>.from(data['subjects']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'schoolLevel': schoolLevel,
      'subjects': subjects,
    };
  }
}
