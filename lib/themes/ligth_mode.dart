import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey[50],

  // Define the ColorScheme without the deprecated 'background' parameter.
  colorScheme: ColorScheme.light(
    primary: Colors.grey[200]!,
    secondary: Colors.grey[400]!,
    // Instead of 'background', adjust 'surface' to your desired color.
    surface: Colors.grey[100]!,
    onPrimary: Colors.grey[800]!,
    onSecondary: Colors.grey[800]!,
    onSurface: Colors.grey[800]!,
  ),

  cardColor: Colors.grey[50],
  dividerColor: Colors.grey[300],

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[200],
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.grey[800]),
    titleTextStyle: TextStyle(
      color: Colors.grey[800],
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),

  textTheme: TextTheme(
    displayLarge: TextStyle(
        color: Colors.grey[900], fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
        color: Colors.grey[900], fontSize: 28, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        color: Colors.grey[900], fontSize: 24, fontWeight: FontWeight.w600),
    headlineLarge: TextStyle(
        color: Colors.grey[900], fontSize: 22, fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(
        color: Colors.grey[900], fontSize: 20, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(
        color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(color: Colors.grey[800], fontSize: 16),
    bodyMedium: TextStyle(color: Colors.grey[800], fontSize: 14),
    titleLarge: TextStyle(color: Colors.grey[700], fontSize: 16),
    titleMedium: TextStyle(color: Colors.grey[700], fontSize: 14),
    labelLarge: TextStyle(
        color: Colors.grey[900], fontSize: 14, fontWeight: FontWeight.bold),
    bodySmall: TextStyle(color: Colors.grey[600], fontSize: 12),
    labelSmall: TextStyle(color: Colors.grey[600], fontSize: 10),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey[200],
      foregroundColor: Colors.grey[800],
      textStyle: TextStyle(fontSize: 16),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[100],
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[400]!),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
