import 'package:flutter/material.dart';
import '../models/project.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/hero_section.dart';
import '../sections/motion_lab_section.dart';
import '../sections/projects_section.dart';
import '../sections/services_section.dart';
import '../sections/stats_strip_section.dart';
import '../widgets/navigation/footer_nav_bar.dart';
import '../widgets/navigation/header_nav_bar.dart';
import 'project_detail_dialog.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollController = ScrollController();
  final _sectionKeys = <String, GlobalKey>{
    'About': GlobalKey(),
    'Projects': GlobalKey(),
    'Motion lab': GlobalKey(),
    'Services': GlobalKey(),
    'Contact': GlobalKey(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _goTo(String name) {
    final context = _sectionKeys[name]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 720),
        curve: Curves.easeInOutCubic,
        alignment: 0.04,
      );
    }
  }

  Future<void> _openProject(Project project) async {
    await showDialog<void>(
      context: context,
      builder: (context) => ProjectDetailDialog(project: project),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              HeaderNavBar(onNavigate: _goTo),
              HeroSection(onNavigate: _goTo),
              const StatsStripSection(),
              AboutSection(key: _sectionKeys['About']),
              ProjectsSection(
                key: _sectionKeys['Projects'],
                onOpenProject: _openProject,
              ),
              MotionLabSection(key: _sectionKeys['Motion lab']),
              ServicesSection(key: _sectionKeys['Services']),
              ContactSection(key: _sectionKeys['Contact']),
              FooterNavBar(onNavigate: _goTo),
            ],
          ),
        ),
      ),
    );
  }
}
