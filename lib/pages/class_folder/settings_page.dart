import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../support_class/app_settings_controller.dart';
import '../../support_class/app_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const double _maxWidth = 1100;

  // Colores “pro” para dark (similar a tu Home en dark)
  static const Color _darkBgTop = Color(0xFF0B1324);
  static const Color _darkBgBottom = Color(0xFF060B16);
  static const Color _darkSurface = Color(0xFF0F1B33);
  static const Color _darkBorder = Color(0xFF23314D);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appSettings,
      builder: (context, _) {
        final isDark = appSettings.isDark;
        final text = AppText.of(context);
        final bgTop = isDark ? _darkBgTop : Colors.white;
        final bgBottom = isDark ? _darkBgBottom : Colors.white;

        return Scaffold(
          backgroundColor: bgBottom,
          body: SafeArea(
            // ✅ Esto asegura que TODO el background (incluyendo arriba) sea igual
            child: Container(
              decoration: isDark
                  ? const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [_darkBgTop, _darkBgBottom],
                      ),
                    )
                  : const BoxDecoration(color: Colors.white),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: _maxWidth),
                  child: CustomScrollView(
                    slivers: [
                      // ✅ HEADER sticky (igual estilo Home)
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _StickyHeaderDelegate(
                          minHeight: 96,
                          maxHeight: 96,
                          bg: bgTop,
                          dividerColor: isDark
                              ? _darkBorder
                              : const Color(0xFFE7E9EE),
                          child: _WebHeader(
                            isDark: isDark,
                            surface: isDark ? _darkSurface : Colors.white,
                            border: isDark
                                ? _darkBorder
                                : const Color(0xFFE7E9EE),
                            textColor: isDark
                                ? Colors.white
                                : const Color(0xFF111827),
                          ),
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 14)),

                      // ✅ CONTENIDO (mismo padding que Home)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _SectionCard(
                                isDark: isDark,
                                surface: isDark ? _darkSurface : Colors.white,
                                border: isDark
                                    ? _darkBorder
                                    : const Color(0xFFE7E9EE),
                                titleColor: isDark
                                    ? Colors.white
                                    : const Color(0xFF111827),
                                bodyColor: isDark
                                    ? Colors.white70
                                    : Colors.black54,
                                title: text.appearance,
                                child: SwitchListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    text.darkMode,
                                    style: TextStyle(
                                      color: isDark
                                          ? Colors.white70
                                          : Colors.black87,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  value: appSettings.isDark,
                                  onChanged: appSettings.toggleDark,
                                ),
                              ),
                              const SizedBox(height: 14),
                              _SectionCard(
                                isDark: isDark,
                                surface: isDark ? _darkSurface : Colors.white,
                                border: isDark
                                    ? _darkBorder
                                    : const Color(0xFFE7E9EE),
                                titleColor: isDark
                                    ? Colors.white
                                    : const Color(0xFF111827),
                                bodyColor: isDark
                                    ? Colors.white70
                                    : Colors.black54,
                                title: text.language,
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    _LangChip(
                                      label: text.english,
                                      selected:
                                          appSettings.locale.languageCode ==
                                          'en',
                                      isDark: isDark,
                                      onTap: () => appSettings.setLocale(
                                        const Locale('en'),
                                      ),
                                    ),
                                    _LangChip(
                                      label: text.spanish,
                                      selected:
                                          appSettings.locale.languageCode ==
                                          'es',
                                      isDark: isDark,
                                      onTap: () => appSettings.setLocale(
                                        const Locale('es'),
                                      ),
                                    ),
                                  ],
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
          ),
        );
      },
    );
  }
}

/// ✅ Sticky header (sin franja blanca): usa el MISMO bg que la pantalla
class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  _StickyHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
    required this.bg,
    required this.dividerColor,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;
  final Color bg;
  final Color dividerColor;

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

    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ✅ fondo igual que la pantalla
          Container(color: bg),

          // blur sutil cuando está pinned
          if (isPinned)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: bg.withOpacity(0.80)),
            ),

          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: child,
            ),
          ),

          // línea sutil abajo cuando pinned
          if (isPinned)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(height: 1, color: dividerColor),
            ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child ||
        oldDelegate.bg != bg ||
        oldDelegate.dividerColor != dividerColor;
  }
}

/// Header igual al Home: “pill” con borde y sombra
class _WebHeader extends StatelessWidget {
  const _WebHeader({
    required this.isDark,
    required this.surface,
    required this.border,
    required this.textColor,
  });

  final bool isDark;
  final Color surface;
  final Color border;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final text = AppText.of(context);
    final linkStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 14,
      color: textColor,
      letterSpacing: 0.2,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.25 : 0.08),
            blurRadius: 14,
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
            isDark: isDark,
          ),
          const Spacer(),
          _NavLink(
            text: text.settings,
            onTap: () => GoRouter.of(context).go("/settings"),
            style: linkStyle,
            isDark: isDark,
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
    required this.isDark,
  });

  final String text;
  final VoidCallback onTap;
  final TextStyle style;
  final bool isDark;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final hoverBg = widget.isDark
        ? Colors.white.withOpacity(0.08)
        : const Color(0xFFF3F5F8);

    final hoverBorder = widget.isDark
        ? Colors.white.withOpacity(0.10)
        : const Color(0xFFE1E6EE);

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
            border: Border.all(
              color: _hover ? hoverBorder : Colors.transparent,
            ),
          ),
          child: Text(widget.text, style: widget.style),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.child,
    required this.isDark,
    required this.surface,
    required this.border,
    required this.titleColor,
    required this.bodyColor,
  });

  final String title;
  final Widget child;

  final bool isDark;
  final Color surface;
  final Color border;
  final Color titleColor;
  final Color bodyColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 10),
          DefaultTextStyle(
            style: TextStyle(color: bodyColor),
            child: child,
          ),
        ],
      ),
    );
  }
}

class _LangChip extends StatelessWidget {
  const _LangChip({
    required this.label,
    required this.selected,
    required this.isDark,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bgSelected = isDark
        ? Colors.white.withOpacity(0.12)
        : const Color(0xFFEFF3F8);
    final bg = isDark ? Colors.white.withOpacity(0.06) : Colors.white;

    final border = isDark
        ? Colors.white.withOpacity(0.10)
        : const Color(0xFFE7E9EE);

    final text = isDark ? Colors.white : const Color(0xFF111827);

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? bgSelected : bg,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (selected) ...[
              Icon(Icons.check, size: 16, color: text),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(color: text, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
