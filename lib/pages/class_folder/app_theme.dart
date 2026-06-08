import 'package:flutter/material.dart';

class AppTheme {
  // Paleta dark moderna
  static const Color _darkBg = Color(0xFF0B1220);
  static const Color _darkSurface = Color(0xFF0F172A);
  static const Color _darkSurface2 = Color(0xFF111C33);
  static const Color _darkBorder = Color(0xFF22314D);
  static const Color _darkText = Color(0xFFE5E7EB);
  static const Color _darkText2 = Color(0xFF9CA3AF);
  static const Color _accent = Color(0xFF60A5FA);
  static const Color _accent2 = Color(0xFF34D399);
  static const Color _danger = Color(0xFFF87171);

  static ThemeData light() {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
      scaffoldBackgroundColor: Colors.white,
      textTheme: base.textTheme.apply(
        bodyColor: const Color(0xFF111827),
        displayColor: const Color(0xFF111827),
      ),
      dividerColor: const Color(0xFFE7E9EE),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF3F5F8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE7E9EE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE7E9EE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF93C5FD), width: 1.2),
        ),
      ),
    );
  }

  static ThemeData dark() {
    final base = ThemeData.dark(useMaterial3: true);

    final scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: _accent,
      onPrimary: const Color(0xFF0B1220),
      secondary: _accent2,
      onSecondary: const Color(0xFF061018),
      error: _danger,
      onError: const Color(0xFF0B1220),
      surface: _darkSurface,
      onSurface: _darkText,
      surfaceContainerHighest: _darkSurface2,
      outline: _darkBorder,
    );

    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: _darkBg,
      textTheme: base.textTheme.apply(
        bodyColor: _darkText,
        displayColor: _darkText,
      ),
      dividerColor: _darkBorder,
      cardTheme: CardThemeData(
        color: _darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          textStyle: WidgetStateProperty.all(
            const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStateProperty.all(const BorderSide(color: _darkBorder)),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          textStyle: WidgetStateProperty.all(
            const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(_darkText),
          textStyle: WidgetStateProperty.all(
            const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _darkSurface,
        hintStyle: const TextStyle(color: _darkText2),
        labelStyle: const TextStyle(color: _darkText2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _accent, width: 1.2),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return _accent;
          return _darkText2;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _accent.withOpacity(0.35);
          }
          return _darkBorder.withOpacity(0.6);
        }),
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: _darkSurface2,
        selectedColor: _accent.withOpacity(0.25),
        side: const BorderSide(color: _darkBorder),
        labelStyle: const TextStyle(color: _darkText),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      hoverColor: _darkSurface2.withOpacity(0.6),
      focusColor: _accent.withOpacity(0.12),
      splashColor: _accent.withOpacity(0.10),
      highlightColor: _accent.withOpacity(0.08),
    );
  }
}
