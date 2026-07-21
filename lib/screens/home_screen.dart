import 'package:flutter/material.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/projects_section.dart';
import '../widgets/services_section.dart';
import '../widgets/skills_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  bool _mobileMenuOpen = false;
  String _activeSection = 'home';

  final _sectionKeys = <String, GlobalKey>{
    'home': GlobalKey(),
    'about': GlobalKey(),
    'projects': GlobalKey(),
    'skills': GlobalKey(),
    'services': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    String activeSection = 'home';
    double maxVisibleHeight = -double.infinity;

    for (final entry in _sectionKeys.entries) {
      final context = entry.value.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          final height = box.size.height;
          final dy = position.dy;

          // Calculate visible vertical height of this section in the viewport
          final screenHeight = MediaQuery.sizeOf(context).height;
          final visibleTop = dy.clamp(0.0, screenHeight);
          final visibleBottom = (dy + height).clamp(0.0, screenHeight);
          final visibleHeight = visibleBottom - visibleTop;

          // The section displaying the largest height inside the screen bounds becomes active
          if (visibleHeight > maxVisibleHeight) {
            maxVisibleHeight = visibleHeight;
            activeSection = entry.key;
          }
        }
      }
    }

    if (activeSection != _activeSection) {
      setState(() {
        _activeSection = activeSection;
      });
    }
  }

  void _navigateTo(String section) {
    setState(() => _mobileMenuOpen = false);
    final context = _sectionKeys[section]?.currentContext;
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
    return Scaffold(
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: true,
              physics: const BouncingScrollPhysics(),
            ),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  KeyedSubtree(
                    key: _sectionKeys['home'],
                    child: const HeroSection(),
                  ),
                  KeyedSubtree(
                    key: _sectionKeys['about'],
                    child: const AboutSection(),
                  ),
                  KeyedSubtree(
                    key: _sectionKeys['projects'],
                    child: const ProjectsSection(),
                  ),
                  KeyedSubtree(
                    key: _sectionKeys['skills'],
                    child: const SkillsSection(),
                  ),
                  KeyedSubtree(
                    key: _sectionKeys['services'],
                    child: const ServicesSection(),
                  ),
                  KeyedSubtree(
                    key: _sectionKeys['contact'],
                    child: const ContactSection(),
                  ),
                  const FooterSection(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              scrollController: _scrollController,
              sectionKeys: _sectionKeys,
              activeSection: _activeSection,
              menuOpen: _mobileMenuOpen,
              onMenuToggle: () =>
                  setState(() => _mobileMenuOpen = !_mobileMenuOpen),
            ),
          ),
          if (MediaQuery.sizeOf(context).width < 900)
            MobileNavDrawer(
              isOpen: _mobileMenuOpen,
              activeSection: _activeSection,
              onClose: () => setState(() => _mobileMenuOpen = false),
              onNavigate: _navigateTo,
            ),
        ],
      ),
    );
  }
}
