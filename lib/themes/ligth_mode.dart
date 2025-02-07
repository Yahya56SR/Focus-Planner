import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFFAFAFA), // Grey 50

  // Define the ColorScheme without the deprecated 'background' parameter.
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF2196F3), // Primary Blue
    secondary: const Color(0xFF1976D2), // Blue 700
    surface: const Color(0xFFFAFAFA), // Grey 50
    onPrimary: Colors.white, // White text/icons on primary
    onSecondary: Colors.white, // White text/icons on secondary
    onSurface: const Color(0xFF212121), // Grey 900 (text on surfaces)
  ),

  // Card Theme
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 2,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),

  // Divider Theme
  dividerTheme: const DividerThemeData(
    color: Color(0xFFEEEEEE), // Grey 200
    thickness: 1,
    space: 0,
  ),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2196F3), // Primary Blue
    elevation: 4,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),

  // Text Theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: Color(0xFF212121), fontSize: 32, fontWeight: FontWeight.bold), // Grey 900
    displayMedium: TextStyle(
        color: Color(0xFF212121), fontSize: 28, fontWeight: FontWeight.bold), // Grey 900
    displaySmall: TextStyle(
        color: Color(0xFF212121), fontSize: 24, fontWeight: FontWeight.w600), // Grey 900
    headlineLarge: TextStyle(
        color: Color(0xFF212121), fontSize: 22, fontWeight: FontWeight.w600), // Grey 900
    headlineMedium: TextStyle(
        color: Color(0xFF212121), fontSize: 20, fontWeight: FontWeight.w600), // Grey 900
    headlineSmall: TextStyle(
        color: Color(0xFF212121), fontSize: 18, fontWeight: FontWeight.w500), // Grey 900
    bodyLarge: TextStyle(color: Color(0xFF212121), fontSize: 16), // Grey 900
    bodyMedium: TextStyle(color: Color(0xFF616161), fontSize: 14), // Grey 700
    titleLarge: TextStyle(color: Color(0xFF212121), fontSize: 16), // Grey 900
    titleMedium: TextStyle(color: Color(0xFF616161), fontSize: 14), // Grey 700
    labelLarge: TextStyle(
        color: Color(0xFF212121), fontSize: 14, fontWeight: FontWeight.bold), // Grey 900
    bodySmall: TextStyle(color: Color(0xFF616161), fontSize: 12), // Grey 700
    labelSmall: TextStyle(color: Color(0xFF616161), fontSize: 10), // Grey 700
  ),

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2196F3), // Primary Blue
      foregroundColor: Colors.white, // White text
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),

  // Text Field Theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFEEEEEE), // Grey 200
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF2196F3)), // Primary Blue
      borderRadius: BorderRadius.circular(8),
    ),
    hintStyle: const TextStyle(color: Color(0xFFBDBDBD)), // Grey 400
    labelStyle: const TextStyle(color: Color(0xFF616161)), // Grey 700
  ),

  // Floating Action Button Theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF2196F3), // Primary Blue
    foregroundColor: Colors.white, // White icon
    elevation: 4,
  ),

  // Bottom Navigation Bar Theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xFF2196F3), // Primary Blue
    unselectedItemColor: Color(0xFFBDBDBD), // Grey 400
    elevation: 4,
  ),

  // Chip Theme
  chipTheme: ChipThemeData(
    backgroundColor: const Color(0xFFEEEEEE), // Grey 200
    selectedColor: const Color(0xFF2196F3), // Primary Blue
    labelStyle: const TextStyle(color: Color(0xFF212121)), // Grey 900
    secondaryLabelStyle: const TextStyle(color: Colors.white), // White text
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),

  // SnackBar Theme
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Color(0xFF212121), // Grey 900
    contentTextStyle: TextStyle(color: Colors.white), // White text
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);