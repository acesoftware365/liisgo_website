import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

// ✅ ADD (1): para leer version/build
import 'package:package_info_plus/package_info_plus.dart';

import 'package:liisgo_website_09142025/support_class/app_text.dart';
import 'package:liisgo_website_09142025/support_class/assets_res.dart';
import 'package:liisgo_website_09142025/support_class/gorouter_folder/gorouter_links.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double _maxWidth = 1100;
  static const double _heroHeightDesktop = 360;

  /// ✅ tamaño badges (solo height de la imagen)
  static const double storeBadgeHeight = 120;

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).scaffoldBackgroundColor;
    final text = AppText.of(context);

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
                        const _HeroSection(),
                        const SizedBox(height: 22),

                        Text(
                          text.ourApps,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          text.homeIntro,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.color
                                    ?.withOpacity(0.70),
                              ),
                        ),
                        const SizedBox(height: 16),

                        LayoutBuilder(
                          builder: (context, c) {
                            final w = c.maxWidth;
                            final crossAxisCount = w >= 1000
                                ? 4
                                : w >= 700
                                ? 2
                                : 1;

                            return GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: crossAxisCount,
                              mainAxisSpacing: 14,
                              crossAxisSpacing: 14,
                              childAspectRatio: 0.92,
                              children: [
                                _AppCard(
                                  title: "Kapi Note",
                                  subtitle: text.scoreNotes,
                                  imagePath: AssetsRes.imagesList[1],
                                  route: "/apps/KapiNote",
                                ),
                                _AppCard(
                                  title: "EzInvoice",
                                  subtitle: text.invoicesPdf,
                                  imagePath: AssetsRes.imagesList[3],
                                  route: "/apps/EzInvoice",
                                ),
                                _AppCard(
                                  title: "ShowMyName",
                                  subtitle: text.digitalSign,
                                  imagePath: AssetsRes.imagesList[4],
                                  route: "/apps/ShowMyName",
                                ),
                                _AppCard(
                                  title: "Alpha Discovery",
                                  subtitle: text.kidsLearning,
                                  imagePath: AssetsRes.imagesList[5],
                                  route: "/apps/AlphaDiscovery",
                                ),
                                _AppCard(
                                  title: text.comingSoon,
                                  subtitle: text.newTools,
                                  imagePath: AssetsRes.imagesList[2],
                                  route: "/apps/ComingSoon",
                                ),
                              ],
                            );
                          },
                        ),

                        const SizedBox(height: 22),
                        const _DownloadStrip(),
                        const SizedBox(height: 22),
                        const _Footer(),

                        // ✅ ADD (2): versión debajo del footer
                        const SizedBox(height: 10),
                        const _AppVersionLine(),
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
/// Sticky Header Delegate (theme-aware)
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
/// Header: Home (left) + Settings (right)
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
/// HERO
/// ---------------------------
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final text = AppText.of(context);
    final w = MediaQuery.of(context).size.width;
    final isWide = w >= 900;

    final s1 = Theme.of(context).colorScheme.surface;
    final s2 = Theme.of(context).colorScheme.surfaceContainerHighest;
    final divider = Theme.of(context).dividerColor;

    final titleStyle = Theme.of(
      context,
    ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900);

    final bodyColor = Theme.of(
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
          ? SizedBox(
              height: HomePage._heroHeightDesktop,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(text.heroTitle, style: titleStyle),
                        const SizedBox(height: 10),
                        Text(
                          text.heroBody,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(color: bodyColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        AssetsRes.homePageLogo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text.heroTitle, style: titleStyle),
                const SizedBox(height: 10),
                Text(
                  text.heroBody,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: bodyColor),
                ),
                const SizedBox(height: 14),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    AssetsRes.homePageLogo,
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
    );
  }
}

/// ---------------------------
/// APP CARD
/// ---------------------------
class _AppCard extends StatefulWidget {
  const _AppCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.route,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final String route;

  @override
  State<_AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<_AppCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final text = AppText.of(context);
    final surface = Theme.of(context).colorScheme.surface;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: _hover ? 22 : 12,
              spreadRadius: _hover ? 1 : 0,
              color: Colors.black.withOpacity(isDark ? 0.24 : 0.08),
              offset: Offset(0, _hover ? 12 : 6),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => GoRouter.of(context).go(widget.route),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ColoredBox(
                      color: isDark
                          ? Colors.white.withOpacity(0.04)
                          : const Color(0xFFF7F8FB),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          widget.imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withOpacity(0.70),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text.open,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.arrow_forward, size: 16),
                  ],
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
/// DOWNLOAD STRIP
/// ---------------------------
class _DownloadStrip extends StatelessWidget {
  const _DownloadStrip();

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
              children: const [
                _DownloadLeft(),
                SizedBox(height: 14),
                _DownloadBadges(),
              ],
            )
          : const Row(
              children: [
                Expanded(child: _DownloadLeft()),
                SizedBox(width: 16),
                _DownloadBadges(),
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
  const _DownloadBadges();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 10,
      children: [
        _BlackBadge(
          child: Image.asset(
            AssetsRes.googlePlay,
            height: HomePage.storeBadgeHeight,
          ),
        ),
        _BlackBadge(
          child: Image.asset(
            AssetsRes.appStore,
            height: HomePage.storeBadgeHeight,
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

/// ✅ ADD (3): App Version debajo del footer (no rompe nada)
class _AppVersionLine extends StatelessWidget {
  const _AppVersionLine();

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(
      context,
    ).textTheme.bodySmall?.color?.withOpacity(0.65);

    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        final info = snapshot.data;
        if (info == null) return const SizedBox.shrink();

        final versionText = "v${info.version}+${info.buildNumber}";

        return Align(
          alignment: Alignment.center,
          child: Text(
            versionText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: muted,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
        );
      },
    );
  }
}
