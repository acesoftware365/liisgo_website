import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../support_class/app_text.dart';
import '../../support_class/assets_res.dart';
import '../../support_class/gorouter_folder/gorouter_links.dart';
import 'app_page.dart'; // usa appLogoSizeWidth/appLogoSizeHeight

class KapiNotePrivacy extends StatelessWidget {
  final List appInformationPrivacy;

  const KapiNotePrivacy({super.key, required this.appInformationPrivacy});

  static const double _maxWidth = 1100;

  // ✅ Igual que Home: tamaño de los badges
  static const double _storeBadgeHeight = 120;

  @override
  Widget build(BuildContext context) {
    // Índices (mantengo tu misma lógica)
    const int indexAppLogo = 0;
    const int indexAppName = 1;
    const int indexTitlePrivacy = 2;
    const int indexDescription = 3;
    const int indexPrivacyGooglePlay = 4;
    const int indexPrivacyAppStore = 5;
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
                // ✅ Header sticky (theme-aware)
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
                        _PrivacyHero(
                          appLogo: appInformationPrivacy[indexAppLogo],
                          title: appInformationPrivacy[indexTitlePrivacy],
                          appName: appInformationPrivacy[indexAppName],
                          description: appInformationPrivacy[indexDescription],
                        ),
                        const SizedBox(height: 22),

                        // ✅ Download strip = MISMO UI que Home (links intactos)
                        _DownloadStrip(
                          googlePlayUrl:
                              appInformationPrivacy[indexPrivacyGooglePlay],
                          appStoreUrl:
                              appInformationPrivacy[indexPrivacyAppStore],
                        ),
                        const SizedBox(height: 22),

                        const _Footer(),
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

/// ---------------------------
/// Sticky Header Delegate (theme-aware como Home)
/// ---------------------------
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
    final bool isPinned = shrinkOffset > 0;

    final bg = Theme.of(context).scaffoldBackgroundColor;
    final divider = Theme.of(context).dividerColor;

    final header = Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: child,
    );

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
          Align(alignment: Alignment.center, child: header),
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

/// ---------------------------
/// Header: Home (left) + Settings (right) (como HomeScreen)
/// ---------------------------
class _WebHeader extends StatelessWidget {
  const _WebHeader();

  @override
  Widget build(BuildContext context) {
    final text = AppText.of(context);
    final surface = Theme.of(context).colorScheme.surface;
    final divider = Theme.of(context).dividerColor;
    final onSurface = Theme.of(context).colorScheme.onSurface;

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
        border: Border.all(color: divider),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 6),
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

/// ---------------------------
/// Hero principal (theme-aware como Home)
/// ---------------------------
class _PrivacyHero extends StatelessWidget {
  const _PrivacyHero({
    required this.appLogo,
    required this.title,
    required this.appName,
    required this.description,
  });

  final String appLogo;
  final dynamic title;
  final dynamic appName;
  final dynamic description;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isWide = w >= 900;

    final s1 = Theme.of(context).colorScheme.surface;
    final s2 = Theme.of(context).colorScheme.surfaceContainerHighest;
    final divider = Theme.of(context).dividerColor;

    final titleStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w900,
      letterSpacing: 0.2,
    );

    final subtitleStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w700,
      color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.70),
    );

    final bodyMuted = Theme.of(
      context,
    ).textTheme.bodyLarge?.color?.withOpacity(0.75);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: divider),
        gradient: LinearGradient(
          colors: [s1, s2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: isWide
          ? Row(
              children: [
                Expanded(
                  child: _PrivacyText(
                    titleStyle: titleStyle,
                    subtitleStyle: subtitleStyle,
                    bodyMuted: bodyMuted,
                    title: title,
                    appName: appName,
                    description: description,
                  ),
                ),
                const SizedBox(width: 16),
                _PrivacyLogo(appLogo: appLogo),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PrivacyText(
                  titleStyle: titleStyle,
                  subtitleStyle: subtitleStyle,
                  bodyMuted: bodyMuted,
                  title: title,
                  appName: appName,
                  description: description,
                ),
                const SizedBox(height: 14),
                Center(child: _PrivacyLogo(appLogo: appLogo)),
              ],
            ),
    );
  }
}

class _PrivacyLogo extends StatelessWidget {
  const _PrivacyLogo({required this.appLogo});
  final String appLogo;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final double size = w < 700 ? 240 : appLogoSizeWidth;

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.asset(
        appLogo,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _PrivacyText extends StatelessWidget {
  const _PrivacyText({
    required this.titleStyle,
    required this.subtitleStyle,
    required this.bodyMuted,
    required this.title,
    required this.appName,
    required this.description,
  });

  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color? bodyMuted;
  final dynamic title;
  final dynamic appName;
  final dynamic description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toString(), style: titleStyle),
        const SizedBox(height: 6),
        Text(appName.toString(), style: subtitleStyle),
        const SizedBox(height: 12),
        Text(
          description.toString(),
          textAlign: TextAlign.justify,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: bodyMuted, height: 1.35),
        ),
      ],
    );
  }
}

/// ---------------------------
/// Download strip (theme-aware como Home, links intactos)
/// ---------------------------
class _DownloadStrip extends StatelessWidget {
  const _DownloadStrip({
    required this.googlePlayUrl,
    required this.appStoreUrl,
  });

  final String googlePlayUrl;
  final String appStoreUrl;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isNarrow = w < 700;

    final surface = Theme.of(context).colorScheme.surface;
    final divider = Theme.of(context).dividerColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: divider),
      ),
      child: isNarrow
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _DownloadLeft(),
                const SizedBox(height: 14),
                _DownloadBadges(
                  googlePlayUrl: googlePlayUrl,
                  appStoreUrl: appStoreUrl,
                ),
              ],
            )
          : Row(
              children: [
                const Expanded(child: _DownloadLeft()),
                const SizedBox(width: 16),
                _DownloadBadges(
                  googlePlayUrl: googlePlayUrl,
                  appStoreUrl: appStoreUrl,
                ),
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
  const _DownloadBadges({
    required this.googlePlayUrl,
    required this.appStoreUrl,
  });

  final String googlePlayUrl;
  final String appStoreUrl;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 10,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () async => launchUrl(Uri.parse(googlePlayUrl)),
          child: _BlackBadge(
            child: Image.asset(
              AssetsRes.googlePlay,
              height: KapiNotePrivacy._storeBadgeHeight,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () async => launchUrl(Uri.parse(appStoreUrl)),
          child: _BlackBadge(
            child: Image.asset(
              AssetsRes.appStore,
              height: KapiNotePrivacy._storeBadgeHeight,
            ),
          ),
        ),
      ],
    );
  }
}

class _BlackBadge extends StatelessWidget {
  const _BlackBadge({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}

/// ---------------------------
/// FOOTER (sin tocar links)
/// ---------------------------
class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    final divider = Theme.of(context).dividerColor;
    final text = AppText.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: divider)),
      ),
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
            onPressed: () async =>
                launchUrl(Uri.parse(GoRouterLinks.googlePrivacyPages[1])),
            child: Text(text.googleAnalyticsPrivacy),
          ),
          TextButton(
            onPressed: () async =>
                launchUrl(Uri.parse(GoRouterLinks.googlePrivacyPages[0])),
            child: Text(text.googleAdmobPrivacy),
          ),
        ],
      ),
    );
  }
}
