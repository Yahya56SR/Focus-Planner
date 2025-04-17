import 'package:excel/excel.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_planner/features/auth/domain/entities/app_user.dart';
import 'package:focus_planner/features/database/data/firestore_db_repo.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart'; // Import for kIsWeb
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc if not already imported
import 'package:focus_planner/features/auth/presentation/cubits/auth_cubit.dart'; // Adjust the import path

Future<void> extractAndSaveTimetable(BuildContext context) async {
  try {
    final authCubit = context.read<AuthCubit>();
    final currentUser = FirebaseAuth.instance.currentUser;
    FirestoreDbRepo dbRepo = FirestoreDbRepo();
    AppUser? userDoc;
    if (currentUser != null) {
      final userId = currentUser.uid;
      try {
        userDoc = await dbRepo.getCurrentUserDoc(userId);
        print("User document exists: ${userDoc.toJson()}"); // Assuming toJson() is the correct method
      } catch (error) {
        print("Error fetching user: $error");
      }
    } else {
      print("No user is currently logged in.");
    }

    if (currentUser == null || userDoc == null) {
      debugPrint("Error: No authenticated user or user document found.");
      return;
    }

    final username = userDoc.name;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      if (kIsWeb) {
        // Web platform: use bytes
        Uint8List? fileBytes = result.files.single.bytes;
        if (fileBytes != null) {
          await _processExcelData(fileBytes, username);
        } else {
          print("Error: Could not read file bytes on web.");
        }
      } else {
        // Mobile/Desktop platform: use path
        String? filePath = result.files.single.path;
        if (filePath != null) {
          var bytes = File(filePath).readAsBytesSync();
          await _processExcelData(bytes, username);
        } else {
          print("Error: Could not get file path on native platform.");
        }
      }
    } else {
      print("User canceled file picking or no file selected.");
    }
  } catch (e) {
    print("Error: $e");
  }
}

Future<void> _processExcelData(Uint8List bytes, String username) async {
  try {
    var excel = Excel.decodeBytes(bytes);
    Sheet sheet = excel.tables.values.first;

    List<Map<String, dynamic>> timetableEntries = []; // Accumulate entries

    for (int row = 1; row < sheet.maxRows; row++) {
      try {
        String subject = sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row))
            .value
            .toString();
        String dayString = sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: row))
            .value
            .toString();
        String startTimeString = sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: row))
            .value
            .toString();
        String endTimeString = sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: row))
            .value
            .toString();
        String classRoom = sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: row))
            .value
            .toString();
        String teacher = sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: row))
            .value
            .toString();

        String dayOfWeek = _parseDayToString(dayString);
        String? startTime =
            _formatTime(startTimeString); // Format time as HH:mm a
        String? endTime = _formatTime(endTimeString); // Format time as HH:mm a

        // Skip if time parsing/formatting failed
        if (startTime == null || endTime == null) {
          print("Skipping row $row due to time parsing/formatting error.");
          continue;
        }

        timetableEntries.add({
          'subject': subject,
          'day': dayOfWeek,
          'startTime': startTime, // Save as formatted string
          'endTime': endTime, // Save as formatted string
          'class': classRoom,
          'teacher': teacher,
        });
      } catch (e) {
        print("Error processing row $row: $e");
      }
    }

    // Save all entries to a single document named after the username
    if (timetableEntries.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('timetables')
          .doc(username) // Use username as document ID
          .set({'entries': timetableEntries});
      print("Timetable data saved to Firestore for user: $username");
    } else {
      print("No timetable entries found to save.");
    }
  } catch (e) {
    print("Error processing Excel data: $e");
  }
}

String _parseDayToString(String dayString) {
  switch (dayString.toLowerCase()) {
    case "monday":
      return "Monday";
    case "tuesday":
      return "Tuesday";
    case "wednesday":
      return "Wednesday";
    case "thursday":
      return "Thursday";
    case "friday":
      return "Friday";
    case "saturday":
      return "Saturday";
    case "sunday":
      return "Sunday";
    default:
      return "Unknown";
  }
}

// New function to format time as HH:mm a
String? _formatTime(String timeString) {
  try {
    timeString = timeString.trim();
    if (timeString.isEmpty) {
      return null;
    }
    try {
      final formatWithSeconds = DateFormat("HH:mm:ss");
      final timeWithSeconds = formatWithSeconds.parse(timeString);
      return DateFormat("HH:mm a").format(timeWithSeconds); // Format here
    } catch (e) {
      final formatWithoutSeconds = DateFormat("HH:mm");
      final timeWithoutSeconds = formatWithoutSeconds.parse(timeString);
      return DateFormat("HH:mm a").format(timeWithoutSeconds); // Format here
    }
  } catch (e) {
    print("Error parsing/formatting time: $e");
    return null;
  }
}
