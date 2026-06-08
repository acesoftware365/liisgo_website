import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../support_class/app_text.dart';

class KapiNotePage extends StatelessWidget {
  const KapiNotePage({super.key});

  static const double _maxWidth = 1100;

  @override
  Widget build(BuildContext context) {
    final text = AppText.of(context);

    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ Sin AppBar, con header sticky como Home/AppPage
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
                        // ✅ Hero simple (mismo estilo)
                        _SimpleHero(
                          title: "Kapi Note",
                          subtitle: text.scoreNotes,
                          body: text.kapiWelcome,
                        ),
                        const SizedBox(height: 22),

                        // ✅ Botón volver (pro)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FilledButton.icon(
                            onPressed: () => GoRouter.of(context).go('/'),
                            icon: const Icon(Icons.arrow_back),
                            label: Text(text.backToHome),
                          ),
                        ),
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

/// ---------------------------------------------------------------------------
/// Sticky Header Delegate (blur + línea sutil cuando está pinned)
/// ---------------------------------------------------------------------------
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

    final header = Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: child,
    );

    return ClipRRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Colors.white),
          if (isPinned)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.white.withOpacity(0.78)),
            ),
          Align(alignment: Alignment.center, child: header),
          if (isPinned)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(height: 1, color: const Color(0xFFE7E9EE)),
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

/// ---------------------------------------------------------------------------
/// Header igual (Home / Contact / Privacy / Settings)
/// ---------------------------------------------------------------------------
class _WebHeader extends StatelessWidget {
  const _WebHeader();

  @override
  Widget build(BuildContext context) {
    final text = AppText.of(context);
    final w = MediaQuery.of(context).size.width;
    final isTight = w < 420;

    final linkStyle = const TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 14,
      color: Color(0xFF111827),
      letterSpacing: 0.2,
    );

    final headerBox = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color(0xFFE7E9EE)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );

    Widget navRow() => Row(
      children: [
        _NavLink(
          text: text.home,
          onTap: () => GoRouter.of(context).go("/"),
          style: linkStyle,
        ),
        const Spacer(),
        _NavLink(text: text.contact, onTap: () {}, style: linkStyle),
        const SizedBox(width: 6),
        _NavLink(text: text.privacy, onTap: () {}, style: linkStyle),
        const SizedBox(width: 6),
        _NavLink(text: text.settings, onTap: () {}, style: linkStyle),
      ],
    );

    Widget navWrap() => Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 6,
      children: [
        _NavLink(
          text: text.home,
          onTap: () => GoRouter.of(context).go("/"),
          style: linkStyle,
        ),
        Spacer(),
        _NavLink(
          text: text.settings,
          onTap: () => GoRouter.of(context).go("/settings"),
          style: linkStyle,
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: headerBox,
      child: isTight ? navWrap() : navRow(),
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
            color: _hover ? const Color(0xFFF3F5F8) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hover ? const Color(0xFFE1E6EE) : Colors.transparent,
            ),
          ),
          child: Text(widget.text, style: widget.style),
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Hero simple con estilo Home
/// ---------------------------------------------------------------------------
class _SimpleHero extends StatelessWidget {
  const _SimpleHero({
    required this.title,
    required this.subtitle,
    required this.body,
  });

  final String title;
  final String subtitle;
  final String body;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(
      context,
    ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE7E9EE)),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFF6F7F9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            body,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.black54,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}
