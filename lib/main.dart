import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:liisgo_website_09142025/support_class/gorouter_folder/gorouter.dart';
import 'package:liisgo_website_09142025/support_class/app_settings_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Cargar preferencias guardadas (dark/light + idioma)
  await appSettings.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ La app reacciona cuando cambias dark o language
    return AnimatedBuilder(
      animation: appSettings,
      builder: (context, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          title: 'Liisgo',

          // ✅ Idiomas (guardado también)
          locale: appSettings.locale,
          supportedLocales: const [
            Locale('en'),
            Locale('es'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          // ✅ Tema (guardado también)
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: appSettings.isDark ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}

/// ---------------------------------------------------------------------------
/// THEMES
/// ---------------------------------------------------------------------------
class AppTheme {
  // Light
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  // Dark (mejor, más “pro”)
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF60A5FA),
      surface: Color(0xFF0F1B33),
      background: Color(0xFF060B16),
    ),
    scaffoldBackgroundColor: const Color(0xFF060B16),
    cardTheme: CardThemeData(
      color: const Color(0xFF0F1B33),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    dividerColor: const Color(0xFF23314D),
  );
}
