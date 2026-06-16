import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../support_class/app_text.dart';
import '../../support_class/assets_res.dart';
import '../../support_class/gorouter_folder/gorouter_links.dart';

// UI constants (se mantienen)
const double appStoreSize = 160;
const double appLogoSizeHeight = 400;
const double appLogoSizeWidth = 400;

// Indices esperados
const int indexAppLogo = 0;
const int indexTitleApp = 1;
const int indexDescriptionApp = 2;
const int indexGooglePlay = 3;
const int indexAppStore = 4;
const int indexAppBackBottom = 5; // compatibilidad
const int indexPrivacy = 6;
const int indexTerms = 7;

class AppPage extends StatelessWidget {
  final String appTitle;
  final List appInformationApp;

  const AppPage({
    super.key,
    required this.appTitle,
    required this.appInformationApp,
  });

  static const double _maxWidth = 1100;

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxWidth),
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyHeaderDelegate(
                    minHeight: 96,
                    maxHeight: 96,
                    child: const _WebHeader(),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 14)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _AppHero(appInformationApp: appInformationApp),
                        const SizedBox(height: 22),
                        _DownloadStrip(appInformationApp: appInformationApp),
                        const SizedBox(height: 22),
                        _Footer(appInformationApp: appInformationApp),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Sticky header delegate (theme-aware)
class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  _StickyHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final isPinned = shrinkOffset > 0;
    final bg = Theme.of(context).scaffoldBackgroundColor;
    final divider = Theme.of(context).dividerColor;

    return ClipRRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: bg),
          if (isPinned)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: bg.withOpacity(0.78)),
            ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: child,
            ),
          ),
          if (isPinned)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(height: 1, color: divider),
            ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}

/// Header: Home (left) + Settings (right)
class _WebHeader extends StatelessWidget {
  const _WebHeader();

  @override
  Widget build(BuildContext context) {
    final text = AppText.of(context);
    final surface = Theme.of(context).colorScheme.surface;
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final linkStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 14,
      color: onSurface,
      letterSpacing: 0.2,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.24 : 0.07),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          _NavLink(
            text: text.home,
            onTap: () => GoRouter.of(context).go("/"),
            style: linkStyle,
          ),
          const Spacer(),
          _NavLink(
            text: text.settings,
            onTap: () => GoRouter.of(context).go("/settings"),
            style: linkStyle,
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.text,
    required this.onTap,
    required this.style,
  });

  final String text;
  final VoidCallback onTap;
  final TextStyle style;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final hoverBg = Theme.of(context).hoverColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _hover ? hoverBg : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(widget.text, style: widget.style),
        ),
      ),
    );
  }
}

/// Hero/App info card (theme-aware)
class _AppHero extends StatelessWidget {
  const _AppHero({required this.appInformationApp});
  final List appInformationApp;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isWide = w >= 900;

    final s1 = Theme.of(context).colorScheme.surface;
    final s2 = Theme.of(context).colorScheme.surfaceContainerHighest;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final titleStyle = Theme.of(
      context,
    ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900);

    final muted = Theme.of(
      context,
    ).textTheme.bodyLarge?.color?.withOpacity(0.75);

    Widget textBlock() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appInformationApp[indexTitleApp].toString().toUpperCase(),
          style: titleStyle,
        ),
        const SizedBox(height: 10),
        Text(
          appInformationApp[indexDescriptionApp].toString(),
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: muted, height: 1.25),
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [s1, s2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.22 : 0.07),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: isWide
          ? Row(
              children: [
                Expanded(child: textBlock()),
                const SizedBox(width: 16),
                _AppLogo(appInformationApp: appInformationApp),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBlock(),
                const SizedBox(height: 14),
                Center(child: _AppLogo(appInformationApp: appInformationApp)),
              ],
            ),
    );
  }
}

class _AppLogo extends StatelessWidget {
  const _AppLogo({required this.appInformationApp});
  final List appInformationApp;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final double size = w < 700 ? 240 : appLogoSizeWidth;

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.asset(
        appInformationApp[indexAppLogo],
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}

/// Download strip igual Home (negro solo badge)
class _DownloadStrip extends StatelessWidget {
  const _DownloadStrip({required this.appInformationApp});
  final List appInformationApp;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isNarrow = w < 700;

    final surface = Theme.of(context).colorScheme.surface;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.20 : 0.06),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: isNarrow
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _DownloadLeft(),
                const SizedBox(height: 14),
                _DownloadBadges(appInformationApp: appInformationApp),
              ],
            )
          : Row(
              children: [
                const Expanded(child: _DownloadLeft()),
                const SizedBox(width: 16),
                _DownloadBadges(appInformationApp: appInformationApp),
              ],
            ),
    );
  }
}

class _DownloadLeft extends StatelessWidget {
  const _DownloadLeft();

  @override
  Widget build(BuildContext context) {
    final text = AppText.of(context);
    final muted = Theme.of(
      context,
    ).textTheme.bodyMedium?.color?.withOpacity(0.70);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text.download,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 4),
        Text(text.mobilePlatforms, style: TextStyle(color: muted, height: 1.2)),
      ],
    );
  }
}

class _DownloadBadges extends StatelessWidget {
  const _DownloadBadges({required this.appInformationApp});
  final List appInformationApp;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 10,
      children: [
        _StoreBadge(
          imagePath: AssetsRes.googlePlay,
          url: appInformationApp[indexGooglePlay].toString(),
        ),
        _StoreBadge(
          imagePath: AssetsRes.appStore,
          url: appInformationApp[indexAppStore].toString(),
        ),
      ],
    );
  }
}

class _StoreBadge extends StatelessWidget {
  const _StoreBadge({required this.imagePath, required this.url});

  final String imagePath;
  final String url;

  @override
  Widget build(BuildContext context) {
    final isAvailable = url.trim().isNotEmpty;

    return Opacity(
      opacity: isAvailable ? 1 : 0.38,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(14),
        ),
        child: InkWell(
          onTap: isAvailable
              ? () async {
                  await launchUrl(Uri.parse(url));
                }
              : null,
          child: Image.asset(imagePath, height: appStoreSize),
        ),
      ),
    );
  }
}

/// Footer sin tocar links
class _Footer extends StatelessWidget {
  const _Footer({required this.appInformationApp});
  final List appInformationApp;

  @override
  Widget build(BuildContext context) {
    final text = AppText.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 18,
        runSpacing: 10,
        children: [
          TextButton(
            onPressed: () => GoRouter.of(context).go(GoRouterLinks.appPages[0]),
            child: const Text("Liisgo"),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).go(
                GoRouterLinks
                    .privacyPolicyPages[appInformationApp[indexPrivacy]],
              );
            },
            child: Text(text.privacyPolicy),
          ),
          if (appInformationApp.length > indexTerms)
            TextButton(
              onPressed: () {
                GoRouter.of(
                  context,
                ).go(GoRouterLinks.termsPages[appInformationApp[indexTerms]]);
              },
              child: Text(text.termsAndConditions),
            ),
          TextButton(
            onPressed: () async {
              await launchUrl(Uri.parse(GoRouterLinks.googlePrivacyPages[1]));
            },
            child: Text(text.googleAnalyticsPrivacy),
          ),
          TextButton(
            onPressed: () async {
              await launchUrl(Uri.parse(GoRouterLinks.googlePrivacyPages[0]));
            },
            child: Text(text.googleAdmobPrivacy),
          ),
        ],
      ),
    );
  }
}
