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
    es: 'Apps simples y útiles para productividad, negocios y aprendizaje temprano.',
    en: 'Simple, useful apps for productivity, business, and early learning.',
  );
  String get heroTitle => chooseText(
    es: 'Apps prácticas para el día a día.',
    en: 'Practical apps for everyday work.',
  );
  String get heroBody => chooseText(
    es: 'Liisgo LLC crea herramientas móviles limpias, rápidas y fáciles de usar para resolver tareas reales sin complicar el flujo.',
    en: 'Liisgo LLC builds clean, fast, easy-to-use mobile tools that solve real tasks without getting in the way.',
  );
  String get exploreApps => chooseText(es: 'Ver apps', en: 'View apps');
  String get contactSales => chooseText(es: 'Contactar', en: 'Contact');
  String get selectAnApp => chooseText(
    es: 'Elige una app para descargarla en tu tienda preferida.',
    en: 'Choose an app to download it from your preferred store.',
  );
  String get appsAvailable =>
      chooseText(es: 'apps publicadas', en: 'published apps');
  String get mobileFirst => chooseText(es: 'diseño móvil', en: 'mobile-first');
  String get privacyFocused =>
      chooseText(es: 'privacidad clara', en: 'clear privacy');
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
  String get termsAndConditions =>
      chooseText(es: 'Términos y condiciones', en: 'Terms and Conditions');
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
