import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

import '../constants/app_colors.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/education_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/services_section.dart';
import '../sections/skills_section.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final show = _scrollController.offset > 400;
      if (show != _showBackToTop) {
        setState(() => _showBackToTop = show);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _downloadResume() {
    final anchor = web.HTMLAnchorElement()
      ..href = 'web/assets/Tanveer_Ahmad_Resume.pdf'
      ..download = 'Tanveer_Ahmad_Resume.pdf';

    anchor.click();
  }

  @override
  Widget build(BuildContext context) {
    final navItems = [
      NavBarItem(title: 'Home', onTap: () => _scrollTo(_homeKey)),
      NavBarItem(title: 'About', onTap: () => _scrollTo(_aboutKey)),
      NavBarItem(title: 'Skills', onTap: () => _scrollTo(_skillsKey)),
      NavBarItem(title: 'Projects', onTap: () => _scrollTo(_projectsKey)),
      NavBarItem(title: 'Experience', onTap: () => _scrollTo(_experienceKey)),
      NavBarItem(title: 'Education', onTap: () => _scrollTo(_educationKey)),
      NavBarItem(title: 'Services', onTap: () => _scrollTo(_servicesKey)),
      NavBarItem(title: 'Contact', onTap: () => _scrollTo(_contactKey)),
    ];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      endDrawer: MobileDrawer(
        items: navItems,
        onResumeTap: _downloadResume,
      ),
      body: Stack(
        children: [
          // Background subtle ambient radial glow
          Positioned(
            top: -150,
            left: -150,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 800,
            right: -200,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.secondary.withValues(alpha: 0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Main scrollable content
          Column(
            children: [
              NavBar(
                items: navItems,
                onResumeTap: _downloadResume,
                onMenuTap: () => _scaffoldKey.currentState?.openEndDrawer(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Container(
                        key: _homeKey,
                        child: HeroSection(
                          onViewProjects: () => _scrollTo(_projectsKey),
                          onContactMe: () => _scrollTo(_contactKey),
                          onDownloadResume: _downloadResume,
                        ),
                      ),
                      Container(
                        key: _aboutKey,
                        child: const AboutSection(),
                      ),
                      Container(
                        key: _skillsKey,
                        child: const SkillsSection(),
                      ),
                      Container(
                        key: _projectsKey,
                        child: const ProjectsSection(),
                      ),
                      Container(
                        key: _experienceKey,
                        child: const ExperienceSection(),
                      ),
                      Container(
                        key: _educationKey,
                        child: const EducationSection(),
                      ),
                      Container(
                        key: _servicesKey,
                        child: const ServicesSection(),
                      ),
                      Container(
                        key: _contactKey,
                        child: const ContactSection(),
                      ),
                      FooterSection(
                        onBackToTop: () {
                          _scrollController.animateTo(
                            0,
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeInOutCubic,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Floating Back-to-Top button
          if (_showBackToTop)
            Positioned(
              bottom: 28,
              right: 28,
              child: FloatingActionButton.small(
                backgroundColor: AppColors.cardBackground,
                foregroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: AppColors.border),
                ),
                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOutCubic,
                  );
                },
                child: const Icon(Icons.keyboard_arrow_up_rounded, size: 22),
              ),
            ),
        ],
      ),
    );
  }
}
