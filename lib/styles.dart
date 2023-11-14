import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme mainTextTheme = TextTheme(
  displayLarge: const TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.bold,
  ),
  // ···
  titleLarge: GoogleFonts.oswald(
    fontSize: 30,
    // fontStyle: FontStyle.italic,
  ),
  bodyMedium: GoogleFonts.merriweather(),
  displaySmall: GoogleFonts.pacifico(),
);

final ThemeData mainAppTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.light,
  ),
  textTheme: mainTextTheme,
  brightness: Brightness.light,
);

final ThemeData mainAppThemeDark = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ),
  textTheme: mainTextTheme,
);
