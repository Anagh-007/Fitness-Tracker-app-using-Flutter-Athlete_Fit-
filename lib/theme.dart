import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme() {
  const seed = Color(0xFF6C5CE7);

  final base = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  return base.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(base.textTheme),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    cardTheme: const CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
    ),
  );
}
// Reusable gradient
const LinearGradient appGradient = LinearGradient(
  colors: [Color(0xFF6C5CE7), Color(0xFF00D4FF)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
