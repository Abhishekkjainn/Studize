import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

var brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;

ThemeData mainAppTheme = ThemeData(
  useMaterial3: true,

  // Define the default brightness and colors
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
  ),
  textTheme: TextTheme(
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
  ),
);
