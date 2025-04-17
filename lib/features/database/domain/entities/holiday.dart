import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_planner/features/enum/country.dart';

class Holiday {
  final Country country;
  final List<String> holidays;

  Holiday({
    required this.country,
    required this.holidays,
  });

  factory Holiday.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Holiday(
      country: Country.values[data['country']],
      holidays: List<String>.from(data['holidays']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'holidays': holidays,
    };
  }
}
