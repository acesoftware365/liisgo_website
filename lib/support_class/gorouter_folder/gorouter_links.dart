import '../app_text.dart';
import '../asset_links.dart';
import '../assets_res.dart';

class GoRouterLinks {
  static List footNoteLinks(bool isEs) => [
    "Liisgo",
    "/",
    AppText.choose(isEs, es: "Política de privacidad", en: "Privacy Policy"),
    AppText.choose(
      isEs,
      es: "Privacidad de Google Analytics",
      en: "Google Analytics Privacy",
    ),
    AppText.choose(
      isEs,
      es: "Privacidad de Google AdMob",
      en: "Google AdMob Privacy",
    ),
  ];

  static const List googlePrivacyPages = [
    'https://policies.google.com/privacy?hl=en',
    "https://policies.google.com/technologies/partner-sites?utm_source=chatgpt.com",
  ];

  static const List privacyPolicyPages = [
    "/",
    "/apps/kapi_note/privacy",
    "/apps/ComingSoon/privacy",
    "/apps/EzInvoice/privacy",
    "/apps/ShowMyName/privacy",
    "/apps/AlphaDiscovery/privacy",
  ];

  static const List appPages = [
    "/",
    "/apps/KapiNote",
    "/apps/ComingSoon",
    "/apps/EzInvoice",
    "/apps/ShowMyName",
    "/apps/AlphaDiscovery",
  ];
}

class ParameterClass {
  static String _t(bool isEs, {required String es, required String en}) {
    return AppText.choose(isEs, es: es, en: en);
  }

  static List kapiNoteInformationApp(bool isEs) => [
    AssetsRes.imagesList[1],
    "Kapi Note",
    _t(
      isEs,
      es:
          "Esta herramienta fue desarrollada con un enfoque en la simplicidad y la funcionalidad. "
          "La cree como un proyecto personal porque, al igual que tú, me apasiona "
          "el dominó y quería una forma más fácil de llevar el control de mis puntuaciones."
          "\n\nSu propósito principal es servir como un sistema confiable para llevar puntuaciones, "
          "eliminando la necesidad de usar papel y lápiz. Fue diseñada para ser "
          "intuitiva, permitiéndote administrar tus juegos de forma rápida y sencilla."
          " Agradezco tus comentarios para futuras mejoras.",
      en:
          "This tool was developed with a focus on simplicity and functionality. "
          "I created it as a personal project because, like you, I'm passionate "
          "about dominoes and wanted an easier way to keep track of my scores."
          "\n\nIts main purpose is to serve as a reliable scorekeeping system, "
          "eliminating the need for paper and pencil. It was designed to be "
          "intuitive, allowing you to manage your games quickly and effortlessly."
          " I appreciate your feedback for future improvements.",
    ),
    AssetsLinks.kapiNoteGooglePlayLink,
    AssetsLinks.kapiNoteAppleAppStore,
    "/",
    1,
  ];

  static List kapiNoteInformationPrivacy(bool isEs) => [
    AssetsRes.imagesList[1],
    "Kapi Note",
    _t(isEs, es: "Política de privacidad", en: "Privacy Policy"),
    _t(
      isEs,
      es:
          'Tu privacidad es importante para nosotros. Nuestra app móvil está diseñada para respetar '
          'tus datos personales. No almacenamos, vendemos ni compartimos tus datos personales '
          'fuera de tu dispositivo. Cualquier información personal permanece segura en '
          'tu teléfono y se usa solo para mejorar tu experiencia con la app.'
          '\n\nSin embargo, usamos Google Analytics para comprender el uso general y el '
          'rendimiento de la app. Esto nos ayuda a mejorar la app, pero puede implicar '
          'que Google recopile algunos datos de uso, como tipo de dispositivo, duración '
          'de la sesión o funciones utilizadas. Estos datos se anonimizan cuando es posible '
          'y nosotros nunca los usamos para identificarte personalmente.\n\nTambién usamos'
          ' Google Ads para mostrar anuncios relevantes dentro de la app. Google'
          ' puede usar información del dispositivo y datos de interacción con anuncios para personalizar '
          'anuncios, según la configuración y preferencias de tu dispositivo.\n\nNo '
          'vendemos ni compartimos directamente tu información personal con terceros.'
          ' Todos los datos recopilados mediante estos servicios son administrados por Google '
          'de acuerdo con sus políticas de privacidad.\n\nPara más información:',
      en:
          'Your privacy is important to us. Our mobile app is designed to respect '
          'your personal data. We do not store, sell, or share your personal data '
          'outside of your device. Any personal information stays securely on '
          'your phone and is used only to improve your experience with the app.'
          '\n\nHowever, we use Google Analytics to understand general app usage '
          'and performance. This helps us improve the app, but it may involve '
          'Google collecting some usage data, such as device type, session '
          'duration, or features used. This data is anonymized where possible '
          'and is never used by us to personally identify you.\n\nWe also use'
          ' Google Ads to show relevant advertisements within the app. Google'
          ' may use device information and ad interaction data to personalize '
          'ads, depending on your device settings and preferences.\n\nWe do not '
          'sell or directly share your personal information with any third parties.'
          ' All data collected through these services is handled by Google '
          'according to their privacy policies.\n\nFor more information:',
    ),
    AssetsLinks.kapiNoteGooglePlayLink,
    AssetsLinks.kapiNoteAppleAppStore,
    "/apps/KapiNote",
    1,
  ];

  static List comingSoonInformationApp(bool isEs) => [
    AssetsRes.imagesList[2],
    _t(isEs, es: "Próximamente", en: "Coming Soon"),
    _t(isEs, es: "Próximamente", en: "Coming Soon"),
    AssetsLinks.kapiNoteGooglePlayLink,
    AssetsLinks.kapiNoteAppleAppStore,
    "/",
    2,
  ];

  static List comingSoonInformationPrivacy(bool isEs) => [
    AssetsRes.imagesList[2],
    _t(isEs, es: "Próximamente", en: "Coming Soon"),
    _t(isEs, es: "Política de privacidad", en: "Privacy Policy"),
    _t(isEs, es: 'Próximamente', en: 'Coming Soon'),
    AssetsLinks.kapiNoteGooglePlayLink,
    AssetsLinks.kapiNoteAppleAppStore,
    '/apps/ComingSoon',
    2,
  ];

  static List ezInvoiceInformationApp(bool isEs) => [
    AssetsRes.imagesList[3],
    "EzInvoice",
    _t(
      isEs,
      es:
          "EzInvoice es una app de facturación simple y profesional diseñada para pequeños "
          "negocios, freelancers y profesionales independientes. La app te ayuda a "
          "crear, administrar y enviar facturas de forma rápida y eficiente desde tu "
          "dispositivo móvil.\n\nCon EzInvoice, puedes generar facturas profesionales en PDF, "
          "dar seguimiento al estado de pago, administrar clientes y ver reportes de ventas por mes "
          "o por año. La app está creada con una interfaz limpia e intuitiva, permitiéndote "
          "enfocarte en tu negocio en lugar del papeleo.\n\nEzInvoice funciona "
          "sin complicaciones en teléfonos y tabletas, ayudándote a mantenerte organizado, en cumplimiento "
          "y en control de tus finanzas dondequiera que estés.",
      en:
          "EzInvoice is a simple and professional invoicing app designed for small "
          "businesses, freelancers, and independent professionals. The app helps "
          "you create, manage, and send invoices quickly and efficiently from your "
          "mobile device.\n\nWith EzInvoice, you can generate professional PDF invoices, "
          "track payment status, manage customers, and view sales reports by month "
          "or year. The app is built with a clean and intuitive interface, allowing "
          "you to focus on your business instead of paperwork.\n\nEzInvoice works "
          "seamlessly on phones and tablets, helping you stay organized, compliant, "
          "and in control of your finances wherever you are.",
    ),
    AssetsLinks.ezInvoiceGooglePlayLink,
    AssetsLinks.ezInvoiceAppleAppStore,
    "/",
    3,
  ];

  static List ezInvoiceInformationPrivacy(bool isEs) => [
    AssetsRes.imagesList[3],
    "EzInvoice",
    _t(isEs, es: "Política de privacidad", en: "Privacy Policy"),
    _t(
      isEs,
      es:
          'Tu privacidad es importante para nosotros. EzInvoice es operada por Liisgo LLC y está '
          'diseñada para ayudar a los usuarios a crear y administrar facturas de forma segura. No vendemos '
          'tu información personal a terceros.\n\nLa app puede recopilar y almacenar '
          'información que proporcionas voluntariamente, como detalles del negocio, nombres de clientes, '
          'artículos de factura, montos, impuestos y propinas. Estos datos se usan únicamente para '
          'proporcionar la funcionalidad principal de la app, generar facturas, reportes y PDF, y '
          'mejorar tu experiencia.\n\nEzInvoice puede recopilar información limitada del dispositivo y de uso '
          '(como interacciones con la app, reportes de fallos o datos de rendimiento) '
          'para mejorar la confiabilidad y estabilidad. Esta información no te identifica '
          'personalmente.\n\nSi usas la versión gratuita, la app puede mostrar anuncios. '
          'Proveedores de anuncios como Google pueden recopilar identificadores anonimizados del dispositivo o '
          'datos de interacción para mostrar y medir anuncios, de acuerdo con sus propias políticas de '
          'privacidad.\n\nLos pagos y suscripciones se procesan de forma segura mediante '
          'Apple App Store o Google Play Store. No recopilamos ni almacenamos los datos de tu '
          'tarjeta de pago.\n\nPuedes controlar permisos como el acceso a contactos desde '
          'la configuración de tu dispositivo en cualquier momento.\n\nELIMINACIÓN DE CUENTA\n\n'
          'Los usuarios pueden solicitar la eliminación de su cuenta de EzInvoice y los datos asociados en '
          'cualquier momento.\n\nPara solicitar la eliminación de la cuenta:\n'
          '1. Envía un correo a sales@liisgo.com\n'
          '2. Usa el asunto: "EzInvoice - Eliminar mi cuenta"\n'
          '3. Incluye el correo electrónico usado para crear tu cuenta de EzInvoice\n\n'
          'Una vez recibida la solicitud, tu cuenta y los datos asociados serán '
          'eliminados permanentemente en un plazo de 30 días.\n\n'
          'Los datos eliminados incluyen:\n'
          '- Datos de autenticación del usuario\n'
          '- Facturas almacenadas y registros relacionados\n\n'
          'Alguna información puede conservarse si la ley lo requiere o por motivos comerciales legítimos, '
          'como contabilidad, cumplimiento o prevención de fraude.\n\n'
          'Para más información o preguntas relacionadas con privacidad, visita nuestro sitio web: '
          'https://liisgo.com/#/apps/EzInvoice/privacy',
      en:
          'Your privacy is important to us. EzInvoice is operated by Liisgo LLC and is '
          'designed to help users create and manage invoices securely. We do not sell '
          'your personal information to third parties.\n\nThe app may collect and store '
          'information that you voluntarily provide, such as business details, customer '
          'names, invoice items, amounts, taxes, and tips. This data is used solely to '
          'provide core app functionality, generate invoices, reports, and PDFs, and '
          'improve your experience.\n\nEzInvoice may collect limited device and usage '
          'information, such as app interactions, crash reports, or performance data, '
          'to improve reliability and stability. This information does not personally '
          'identify you.\n\nIf you use the free version, the app may display advertisements. '
          'Ad providers such as Google may collect anonymized device identifiers or '
          'interaction data to display and measure ads, according to their own privacy '
          'policies.\n\nPayments and subscriptions are processed securely through the '
          'Apple App Store or Google Play Store. We do not collect or store your payment '
          'card details.\n\nYou may control permissions such as contacts access through '
          'your device settings at any time.\n\nACCOUNT DELETION\n\n'
          'Users may request deletion of their EzInvoice account and associated data at '
          'any time.\n\nTo request account deletion:\n'
          '1. Send an email to sales@liisgo.com\n'
          '2. Use the subject line: "EzInvoice - Delete My Account"\n'
          '3. Include the email address used to create your EzInvoice account\n\n'
          'Once the request is received, your account and associated data will be '
          'permanently deleted within 30 days.\n\n'
          'Data deleted includes:\n'
          '- User authentication data\n'
          '- Stored invoices and related records\n\n'
          'Some information may be retained if required by law or for legitimate business '
          'purposes, such as accounting, compliance, or fraud prevention.\n\n'
          'For more information or privacy-related questions, please visit our website: '
          'https://liisgo.com/#/apps/EzInvoice/privacy',
    ),
    AssetsLinks.ezInvoiceGooglePlayLink,
    AssetsLinks.ezInvoiceAppleAppStore,
    "/apps/EzInvoice",
    3,
  ];

  static List showMyNameInformationApp(bool isEs) => [
    AssetsRes.imagesList[4],
    "ShowMyName",
    _t(
      isEs,
      es:
          "ShowMyName es una app limpia de letrero digital que te permite mostrar nombres, mensajes "
          "y emojis en un estilo llamativo de pantalla completa, perfecta para recogidas, eventos, aeropuertos "
          "o anuncios rápidos.\n\nPersonaliza tu texto, elige estilos visuales y "
          "muestra tu mensaje claramente desde la distancia con un diseño minimalista y sin distracciones.",
      en:
          "ShowMyName is a clean digital sign app that lets you display names, messages, "
          "and emojis in a bold, full-screen style, perfect for pickups, events, airports, "
          "or quick announcements.\n\nCustomize your text, choose visual presets, and "
          "show your message clearly from a distance with a minimal, distraction-free design.",
    ),
    AssetsLinks.showMyNameGooglePlayLink,
    AssetsLinks.showMyNameAppleAppStore,
    "/",
    4,
  ];

  static List showMyNameInformationPrivacy(bool isEs) => [
    AssetsRes.imagesList[4],
    "ShowMyName",
    _t(isEs, es: "Política de privacidad", en: "Privacy Policy"),
    _t(
      isEs,
      es:
          "ShowMyName no vende ni comparte tus datos personales.\n\n"
          "Todos los mensajes que creas y cualquier logo opcional se almacenan localmente en tu dispositivo y nunca se "
          "suben a nuestros servidores.\n\n"
          "Si eliges la versión Pro, las compras se procesan de forma segura mediante Apple o Google. Solo recibimos "
          "confirmación del estado de tu compra.\n\n"
          "Podemos recopilar datos anónimos de fallos o rendimiento para mejorar la estabilidad de la app.\n\n"
          "Para soporte o preguntas, contáctanos en sales@liisgo.com.",
      en:
          "ShowMyName does not sell or share your personal data.\n\n"
          "All messages you create and any optional logo are stored locally on your device and are never "
          "uploaded to our servers.\n\n"
          "If you choose the Pro version, purchases are processed securely by Apple or Google. We only receive "
          "confirmation of your purchase status.\n\n"
          "We may collect anonymous crash or performance data to improve app stability.\n\n"
          "For support or questions, contact us at sales@liisgo.com.",
    ),
    AssetsLinks.showMyNameGooglePlayLink,
    AssetsLinks.showMyNameAppleAppStore,
    "/apps/ShowMyName",
    4,
  ];

  static List alphaDiscoveryInformationApp(bool isEs) => [
    AssetsRes.imagesList[5],
    "Alpha Discovery",
    _t(
      isEs,
      es:
          "Alpha Discovery es una app educativa interactiva diseñada para que los niños exploren y aprendan lo básico jugando. "
          "Con una interfaz colorida e intuitiva, los niños pueden descubrir el alfabeto, números, colores, animales, sonidos, formas, clima y mucho más.\n\n"
          "Creada pensando en la simplicidad y la diversión, ofrece un entorno atractivo para el aprendizaje temprano, ayudando a los niños "
          "a desarrollar habilidades fundamentales mientras exploran el mundo que los rodea.",
      en:
          "Alpha Discovery is an interactive educational app designed for children to explore and learn the basics through play. "
          "With a colorful and intuitive interface, kids can discover the alphabet, numbers, colors, animals, sounds, shapes, weather, and much more.\n\n"
          "Built with simplicity and fun in mind, it provides an engaging environment for early learning, helping children "
          "build foundational skills while exploring the world around them.",
    ),
    AssetsLinks.alphaDiscoveryGooglePlayLink,
    AssetsLinks.alphaDiscoveryAppleAppStore,
    "/",
    5,
  ];

  static List alphaDiscoveryInformationPrivacy(bool isEs) => [
    AssetsRes.imagesList[5],
    "Alpha Discovery",
    _t(isEs, es: "Política de privacidad", en: "Privacy Policy"),
    _t(
      isEs,
      es:
          "Alpha Discovery está diseñada pensando en la seguridad y privacidad de los niños. No vendemos ni compartimos datos personales.\n\n"
          "La app no recopila información personal de sus usuarios pequeños. Todo el progreso de aprendizaje y las preferencias se almacenan "
          "localmente en tu dispositivo y nunca se suben a nuestros servidores.\n\n"
          "Si eliges la versión Pro, las compras se gestionan de forma segura mediante Apple o Google. Solo recibimos confirmación del "
          "estado de la suscripción para desbloquear contenido.\n\n"
          "Podemos recopilar datos anónimos de rendimiento para asegurar que la app funcione correctamente. Para cualquier pregunta, contáctanos en sales@liisgo.com.",
      en:
          "Alpha Discovery is designed with children's safety and privacy in mind. We do not sell or share any personal data.\n\n"
          "The app does not collect personal information from its young users. All learning progress and preferences are stored "
          "locally on your device and are never uploaded to our servers.\n\n"
          "If you choose the Pro version, purchases are handled securely by Apple or Google. We only receive confirmation of "
          "the subscription status to unlock content.\n\n"
          "We may collect anonymous performance data to ensure the app runs smoothly. For any questions, please contact us at sales@liisgo.com.",
    ),
    AssetsLinks.alphaDiscoveryGooglePlayLink,
    AssetsLinks.alphaDiscoveryAppleAppStore,
    "/apps/AlphaDiscovery",
    5,
  ];
}
