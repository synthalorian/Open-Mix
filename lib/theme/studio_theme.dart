import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudioTheme {
  static const _bg = Color(0xFF0A0E14);
  static const _surface = Color(0xFF131820);
  static const _card = Color(0xFF1A2030);
  static const _blue = Color(0xFF4FC3F7);
  static const _teal = Color(0xFF00BFA5);
  static const _textPrimary = Color(0xFFE0E8F0);
  static const _textSecondary = Color(0xFF6B7D8E);

  static Color get blue => _blue;
  static Color get teal => _teal;
  static Color get card => _card;
  static Color get surface => _surface;

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _bg,
    colorScheme: const ColorScheme.dark(primary: _blue, secondary: _teal, surface: _surface),
    cardColor: _card,
    appBarTheme: AppBarTheme(backgroundColor: _bg, elevation: 0, centerTitle: true,
      titleTextStyle: GoogleFonts.inter(color: _textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
    textTheme: GoogleFonts.interTextTheme(const TextTheme(
      headlineLarge: TextStyle(color: _textPrimary, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: _textPrimary),
      bodyMedium: TextStyle(color: _textSecondary),
    )),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? _teal : _surface),
      checkColor: WidgetStateProperty.all(Colors.white),
    ),
  );
}
