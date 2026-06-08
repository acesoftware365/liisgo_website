import 'package:flutter/material.dart';

class AppText {
  const AppText._(this.isEs);

  final bool isEs;

  static AppText of(BuildContext context) {
    return AppText._(Localizations.localeOf(context).languageCode == 'es');
  }

  static String choose(bool isEs, {required String es, required String en}) {
    return isEs ? es : en;
  }

  String chooseText({required String es, required String en}) {
    return choose(isEs, es: es, en: en);
  }

  String get home => chooseText(es: 'Inicio', en: 'Home');
  String get settings => chooseText(es: 'Configuración', en: 'Settings');
  String get ourApps => chooseText(es: 'Nuestras apps', en: 'Our Apps');
  String get homeIntro => chooseText(
    es: 'Herramientas simples y útiles creadas por Liisgo LLC.',
    en: 'Simple, useful tools built by Liisgo LLC.',
  );
  String get heroTitle => chooseText(
    es: 'Trabaja con más inteligencia.\nAvanza más rápido.',
    en: 'Build smarter.\nWork faster.',
  );
  String get heroBody => chooseText(
    es: 'Liisgo crea apps limpias y prácticas para la productividad diaria.',
    en: 'Liisgo creates clean and practical apps for everyday productivity.',
  );
  String get scoreNotes =>
      chooseText(es: 'Puntuación / notas', en: 'Scoreboard / notes');
  String get invoicesPdf =>
      chooseText(es: 'Facturas y PDF', en: 'Invoices & PDF');
  String get digitalSign =>
      chooseText(es: 'Letrero digital', en: 'Digital sign');
  String get kidsLearning =>
      chooseText(es: 'App educativa para niños', en: 'Kids Learning App');
  String get comingSoon => chooseText(es: 'Próximamente', en: 'Coming Soon');
  String get newTools => chooseText(es: 'Nuevas herramientas', en: 'New tools');
  String get open => chooseText(es: 'Abrir', en: 'Open');
  String get download => chooseText(es: 'Descargar', en: 'Download');
  String get mobilePlatforms => chooseText(
    es: 'Disponible en plataformas móviles',
    en: 'Available on mobile platforms',
  );
  String get privacyPolicy =>
      chooseText(es: 'Política de privacidad', en: 'Privacy Policy');
  String get googleAnalyticsPrivacy => chooseText(
    es: 'Privacidad de Google Analytics',
    en: 'Google Analytics Privacy',
  );
  String get googleAdmobPrivacy =>
      chooseText(es: 'Privacidad de Google AdMob', en: 'Google AdMob Privacy');
  String get appearance => chooseText(es: 'Apariencia', en: 'Appearance');
  String get darkMode => chooseText(es: 'Modo oscuro', en: 'Dark mode');
  String get language => chooseText(es: 'Idioma', en: 'Language');
  String get english => chooseText(es: 'Inglés', en: 'English');
  String get spanish => chooseText(es: 'Español', en: 'Spanish');
  String get contact => chooseText(es: 'Contacto', en: 'Contact');
  String get privacy => chooseText(es: 'Privacidad', en: 'Privacy');
  String get backToHome =>
      chooseText(es: 'Volver al inicio', en: 'Back to Home');
  String get kapiWelcome => chooseText(
    es: 'Bienvenido a Kapi Note. Aquí puedes agregar el contenido de esta página.',
    en: 'Welcome to Kapi Note. Here you can add your content for this page.',
  );
}
