import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../home_page.dart';
import '../../pages/class_folder/about_pages.dart';
import '../../pages/class_folder/app_page.dart';
import '../../pages/class_folder/privacy_page.dart';
import '../../pages/class_folder/settings_page.dart';
import '../app_text.dart';
import 'gorouter_links.dart';

// Definir las rutas con GoRouter
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/new_page',
      builder: (BuildContext context, GoRouterState state) {
        return const KapiNotePage();
      },
    ),

    // Coming Soon Routes
    GoRoute(
      path: '/apps/ComingSoon',
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return AppPage(
          appTitle: 'Coming Soon',
          appInformationApp: ParameterClass.comingSoonInformationApp(isEs),
        );
      },
    ),
    GoRoute(
      path: '/apps/ComingSoon/privacy',
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return KapiNotePrivacy(
          appInformationPrivacy: ParameterClass.comingSoonInformationPrivacy(
            isEs,
          ),
        );
      },
    ),

    // Kapi Note Routes
    GoRoute(
      path: "/apps/KapiNote",
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return AppPage(
          appTitle: 'Kapi Note',
          appInformationApp: ParameterClass.kapiNoteInformationApp(isEs),
        );
      },
    ),
    GoRoute(
      path: '/apps/kapi_note/privacy',
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return KapiNotePrivacy(
          appInformationPrivacy: ParameterClass.kapiNoteInformationPrivacy(
            isEs,
          ),
        );
      },
    ),
    GoRoute(
      path: '/apps/KapiNote/terms',
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return KapiNotePrivacy(
          appInformationPrivacy: ParameterClass.kapiNoteInformationTerms(isEs),
        );
      },
    ),

    // EzInvoice Routes
    GoRoute(
      path: "/apps/EzInvoice",
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return AppPage(
          appTitle: 'EzInvoice',
          appInformationApp: ParameterClass.ezInvoiceInformationApp(isEs),
        );
      },
    ),
    GoRoute(
      path: '/apps/EzInvoice/privacy',
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return KapiNotePrivacy(
          appInformationPrivacy: ParameterClass.ezInvoiceInformationPrivacy(
            isEs,
          ),
        );
      },
    ),
    GoRoute(
      path: '/apps/EzInvoice/terms',
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return KapiNotePrivacy(
          appInformationPrivacy: ParameterClass.ezInvoiceInformationTerms(isEs),
        );
      },
    ),

    // ShowMyName Routes
    GoRoute(
      path: "/apps/ShowMyName",
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return AppPage(
          appTitle: 'ShowMyName',
          appInformationApp: ParameterClass.showMyNameInformationApp(isEs),
        );
      },
    ),
    GoRoute(
      path: '/apps/ShowMyName/privacy',
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return KapiNotePrivacy(
          appInformationPrivacy: ParameterClass.showMyNameInformationPrivacy(
            isEs,
          ),
        );
      },
    ),

    // Alpha Discovery Routes
    GoRoute(
      path: "/apps/AlphaDiscovery",
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return AppPage(
          appTitle: 'Alpha Discovery',
          appInformationApp: ParameterClass.alphaDiscoveryInformationApp(isEs),
        );
      },
    ),
    GoRoute(
      path: '/apps/AlphaDiscovery/privacy',
      builder: (BuildContext context, GoRouterState state) {
        final isEs = AppText.of(context).isEs;
        return KapiNotePrivacy(
          appInformationPrivacy:
              ParameterClass.alphaDiscoveryInformationPrivacy(isEs),
        );
      },
    ),

    GoRoute(
      path: '/settings',
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsPage();
      },
    ),
  ],
);
