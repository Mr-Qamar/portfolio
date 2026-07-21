import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/url_helper.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
    required this.activeSection,
    this.menuOpen = false,
    this.onMenuToggle,
  });

  final ScrollController scrollController;
  final Map<String, GlobalKey> sectionKeys;
  final String activeSection;
  final bool menuOpen;
  final VoidCallback? onMenuToggle;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 40;
    if (scrolled != _scrolled) {
      setState(() => _scrolled = scrolled);
    }
  }

  void _scrollTo(String key) {
    if (widget.menuOpen && widget.onMenuToggle != null) {
      widget.onMenuToggle!();
    }
    final targetKey = widget.sectionKeys[key];
    final context = targetKey?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0.05,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: _scrolled
            ? AppTheme.background.withValues(alpha: 0.92)
            : Colors.transparent,
        border: _scrolled
            ? const Border(bottom: BorderSide(color: AppTheme.border))
            : null,
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 40 : 20,
            vertical: 16,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => _scrollTo('home'),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppTheme.primary, AppTheme.accent],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'QZ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    if (isWide) ...[
                      const SizedBox(width: 12),
                      Text(
                        PortfolioData.profile.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ],
                ),
              ),
              const Spacer(),
              if (isWide)
                ...PortfolioData.navItems.map(
                  (item) {
                    final isActive = item.$2 == widget.activeSection;
                    return Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextButton(
                        onPressed: () => _scrollTo(item.$2),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          foregroundColor: isActive ? AppTheme.primary : AppTheme.textSecondary,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              item.$1,
                              style: TextStyle(
                                color: isActive ? AppTheme.primary : AppTheme.textSecondary,
                                fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
                                fontSize: isActive ? 16 : 14,
                              ),
                            ),
                            const SizedBox(height: 2),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 2,
                              width: isActive ? 16 : 0,
                              decoration: BoxDecoration(
                                color: AppTheme.primary,
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              else if (widget.onMenuToggle != null)
                IconButton(
                  onPressed: widget.onMenuToggle,
                  icon: Icon(widget.menuOpen ? Icons.close : Icons.menu),
                  color: AppTheme.textPrimary,
                ),
              const SizedBox(width: 8),
              if (isWide)
                ElevatedButton(
                  onPressed: () => openEmail(PortfolioData.contact.email),
                  child: const Text('Hire Me'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileNavDrawer extends StatelessWidget {
  const MobileNavDrawer({
    super.key,
    required this.isOpen,
    required this.activeSection,
    required this.onClose,
    required this.onNavigate,
  });

  final bool isOpen;
  final String activeSection;
  final VoidCallback onClose;
  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    if (!isOpen) return const SizedBox.shrink();

    return Positioned.fill(
      top: 72,
      child: GestureDetector(
        onTap: onClose,
        child: ColoredBox(
          color: Colors.black54,
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 260,
              color: AppTheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final item in PortfolioData.navItems) ...[
                    Builder(
                      builder: (context) {
                        final isActive = item.$2 == activeSection;
                        return Container(
                          decoration: BoxDecoration(
                            border: isActive
                                ? const Border(
                                    left: BorderSide(
                                      color: AppTheme.primary,
                                      width: 4,
                                    ),
                                  )
                                : null,
                            color: isActive
                                ? AppTheme.primary.withValues(alpha: 0.08)
                                : Colors.transparent,
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                            title: Text(
                              item.$1,
                              style: TextStyle(
                                color: isActive ? AppTheme.primary : AppTheme.textSecondary,
                                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                                fontSize: isActive ? 16 : 14,
                              ),
                            ),
                            onTap: () => onNavigate(item.$2),
                          ),
                        );
                      },
                    ),
                  ],
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        onClose();
                        openEmail(PortfolioData.contact.email);
                      },
                      child: const Text('Hire Me'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
