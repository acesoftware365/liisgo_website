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

  static const List termsPages = [
    "/",
    "/apps/KapiNote/terms",
    "/apps/ComingSoon/terms",
    "/apps/EzInvoice/terms",
    "/apps/ShowMyName/terms",
    "/apps/AlphaDiscovery/terms",
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
          "intuitiva y flexible, permitiéndote administrar partidas, jugadores y "
          "puntuaciones de forma rápida y sencilla.\n\nKapi Note está pensada para "
          "partidas casuales, familiares o competitivas donde necesitas una forma "
          "clara de seguir el marcador, ajustar el tamaño del score y compartir la app "
          "con otros jugadores.",
      en:
          "This tool was developed with a focus on simplicity and functionality. "
          "I created it as a personal project because, like you, I'm passionate "
          "about dominoes and wanted an easier way to keep track of my scores."
          "\n\nIts main purpose is to serve as a reliable scorekeeping system, "
          "eliminating the need for paper and pencil. It was designed to be "
          "intuitive and flexible, allowing you to manage games, players, and scores "
          "quickly and effortlessly.\n\nKapi Note is built for casual, family, or "
          "competitive matches where you need a clear way to follow the scoreboard, "
          "adjust score size, and share the app with other players.",
    ),
    AssetsLinks.kapiNoteGooglePlayLink,
    AssetsLinks.kapiNoteAppleAppStore,
    "/",
    1,
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

  static List kapiNoteInformationTerms(bool isEs) => [
    AssetsRes.imagesList[1],
    "Kapi Note",
    _t(isEs, es: "Términos y condiciones", en: "Terms and Conditions"),
    _t(
      isEs,
      es:
          "Al usar Kapi Note, aceptas usar la app de forma responsable y únicamente para llevar el control de puntuaciones de dominó u otros juegos compatibles con su funcionamiento.\n\n"
          "Kapi Note se ofrece como una herramienta de apoyo para registrar puntuaciones. El usuario es responsable de revisar que los nombres, equipos, puntos y resultados introducidos sean correctos.\n\n"
          "La app puede incluir anuncios o servicios de terceros como Google Ads, Google Analytics o servicios similares para mejorar la experiencia, medir rendimiento y sostener el desarrollo. El uso de esos servicios está sujeto a las políticas de sus proveedores.\n\n"
          "No debes intentar modificar, copiar, revender, descompilar o usar la app de una forma que afecte su seguridad, funcionamiento o disponibilidad.\n\n"
          "La app se proporciona tal como está. Aunque trabajamos para mantenerla estable y útil, no garantizamos que esté libre de errores o disponible sin interrupciones. Liisgo LLC no será responsable por pérdidas derivadas del uso o imposibilidad de uso de la app.\n\n"
          "Podemos actualizar estos términos ocasionalmente. El uso continuo de Kapi Note después de un cambio significa que aceptas los términos actualizados.\n\n"
          "Para preguntas o soporte, contáctanos en sales@liisgo.com.",
      en:
          "By using Kapi Note, you agree to use the app responsibly and only for tracking domino scores or other games compatible with its functionality.\n\n"
          "Kapi Note is provided as a support tool for recording scores. You are responsible for checking that names, teams, points, and results entered into the app are accurate.\n\n"
          "The app may include ads or third-party services such as Google Ads, Google Analytics, or similar services to improve the experience, measure performance, and support development. Use of those services is subject to their providers' policies.\n\n"
          "You may not attempt to modify, copy, resell, decompile, or use the app in a way that affects its security, operation, or availability.\n\n"
          "The app is provided as is. Although we work to keep it stable and useful, we do not guarantee that it will be error-free or available without interruption. Liisgo LLC is not responsible for losses resulting from use of the app or inability to use it.\n\n"
          "We may update these terms from time to time. Continued use of Kapi Note after a change means you accept the updated terms.\n\n"
          "For questions or support, contact us at sales@liisgo.com.",
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
          "EzInvoice es una app de facturación simple y profesional para pequeños negocios, "
          "freelancers y profesionales independientes. Te ayuda a crear facturas, generar "
          "PDF, administrar clientes y revisar reportes desde tu dispositivo móvil.\n\n"
          "La app incluye herramientas para estados de factura como borrador, enviada o pagada; "
          "reportes por periodo; perfiles de negocio; estilos de factura; y funciones Pro como "
          "facturas ilimitadas, reportes avanzados y experiencia sin anuncios según el plan disponible.\n\n"
          "EzInvoice está diseñada para trabajar rápido desde teléfono o tableta, con una interfaz "
          "limpia para que puedas enfocarte en cobrar, organizar tu negocio y mantener tus registros al día.",
      en:
          "EzInvoice is a simple, professional invoicing app for small businesses, "
          "freelancers, and independent professionals. It helps you create invoices, "
          "generate PDFs, manage customers, and review reports from your mobile device.\n\n"
          "The app includes tools for invoice statuses such as draft, sent, and paid; "
          "period reports; business profiles; invoice styles; and Pro features such as "
          "unlimited invoices, advanced reports, and an ad-free experience depending on the available plan.\n\n"
          "EzInvoice is designed for fast work on phones and tablets, with a clean interface "
          "so you can focus on getting paid, organizing your business, and keeping records up to date.",
    ),
    AssetsLinks.ezInvoiceGooglePlayLink,
    AssetsLinks.ezInvoiceAppleAppStore,
    "/",
    3,
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

  static List ezInvoiceInformationTerms(bool isEs) => [
    AssetsRes.imagesList[3],
    "EzInvoice",
    _t(isEs, es: "Términos y condiciones", en: "Terms and Conditions"),
    _t(
      isEs,
      es:
          "Al usar EzInvoice, aceptas usar la app de forma responsable para crear, administrar, exportar y compartir facturas, clientes, reportes y datos relacionados con tu negocio.\n\n"
          "El usuario es responsable de la exactitud de toda la información ingresada, incluyendo datos del negocio, clientes, artículos, precios, impuestos, propinas, estados de pago y cualquier información incluida en facturas o reportes. EzInvoice no ofrece asesoría legal, contable, fiscal o financiera.\n\n"
          "Las funciones Pro, incluyendo facturas ilimitadas, reportes avanzados, estilos premium o experiencia sin anuncios, pueden requerir una compra o suscripción. Los pagos, renovaciones, cancelaciones y reembolsos son administrados por Apple App Store o Google Play según la plataforma usada. Puedes administrar o cancelar suscripciones desde la configuración de tu cuenta de tienda.\n\n"
          "No debes usar EzInvoice para actividades ilegales, fraudulentas, engañosas o no autorizadas. Tampoco debes intentar modificar, copiar, revender, descompilar o interferir con la seguridad o disponibilidad de la app.\n\n"
          "EzInvoice se proporciona tal como está. Aunque trabajamos para mantener la app estable y precisa, no garantizamos que esté libre de errores, disponible sin interrupciones o adecuada para todos los requisitos comerciales, fiscales o regulatorios. Liisgo LLC no será responsable por pérdidas derivadas del uso o imposibilidad de uso de la app.\n\n"
          "Podemos actualizar estos términos ocasionalmente. El uso continuo de EzInvoice después de un cambio significa que aceptas los términos actualizados.\n\n"
          "Para preguntas, soporte o asuntos relacionados con cuenta, contáctanos en sales@liisgo.com.",
      en:
          "By using EzInvoice, you agree to use the app responsibly to create, manage, export, and share invoices, customers, reports, and related business data.\n\n"
          "You are responsible for the accuracy of all information entered, including business details, customers, items, prices, taxes, tips, payment statuses, and any information included in invoices or reports. EzInvoice does not provide legal, accounting, tax, or financial advice.\n\n"
          "Pro features, including unlimited invoices, advanced reports, premium styles, or an ad-free experience, may require a purchase or subscription. Payments, renewals, cancellations, and refunds are managed by Apple App Store or Google Play depending on the platform used. You can manage or cancel subscriptions from your store account settings.\n\n"
          "You may not use EzInvoice for illegal, fraudulent, misleading, or unauthorized activity. You may also not attempt to modify, copy, resell, decompile, or interfere with the security or availability of the app.\n\n"
          "EzInvoice is provided as is. Although we work to keep the app stable and accurate, we do not guarantee that it will be error-free, available without interruption, or suitable for every business, tax, or regulatory requirement. Liisgo LLC is not responsible for losses resulting from use of the app or inability to use it.\n\n"
          "We may update these terms from time to time. Continued use of EzInvoice after a change means you accept the updated terms.\n\n"
          "For questions, support, or account-related matters, contact us at sales@liisgo.com.",
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
