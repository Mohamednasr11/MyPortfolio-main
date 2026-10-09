import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../data/portfolio_data.dart';
import '../models/project.dart';
import '../widgets/common/section_header.dart';
import '../widgets/common/tag_chip.dart';
import '../widgets/mockup/goldie_device_mockup.dart';

class ProjectsSection extends StatelessWidget {
  final ValueChanged<Project> onOpenProject;

  const ProjectsSection({super.key, required this.onOpenProject});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      number: '02',
      eyebrow: 'SELECTED WORK',
      title: 'A few things',
      accent: "I've shipped.",
      description:
          'Selected product work across commerce, enterprise workflows, hospitality, and construction safety displayed in high-fidelity mockups.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth > 880 ? 2 : 1;
          const gap = 24.0;
          final cardWidth =
              (constraints.maxWidth - gap * (columns - 1)) / columns;

          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: PortfolioData.projects
                .map(
                  (project) => SizedBox(
                    width: cardWidth,
                    child: _ProjectCard(
                      project: project,
                      onTap: () => onOpenProject(project),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback onTap;

  const _ProjectCard({required this.project, required this.onTap});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
          decoration: BoxDecoration(
            color: AppColors.panel,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered
                  ? AppColors.withAlphaOpacity(AppColors.lime, 0.45)
                  : Colors.white10,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.withAlphaOpacity(AppColors.lime, 0.1),
                      blurRadius: 28,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : [],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Goldie Mockup Showcase Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF102838),
                      Color(0xFF07131C),
                    ],
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    width: 210,
                    child: GoldieDeviceMockup(
                      imagePath: widget.project.image,
                      width: 210,
                      height: 380,
                      enableHoverEffect: false,
                    ),
                  ),
                ),
              ),

              // Content Details
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TagChip(widget.project.category),
                        const Spacer(),
                        AnimatedRotation(
                          turns: _hovered ? 0.125 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            Icons.arrow_outward_rounded,
                            color: _hovered ? AppColors.lime : AppColors.paper,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      widget.project.name,
                      style: const TextStyle(
                        color: AppColors.paper,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.7,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.project.description,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 12,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 7,
                      runSpacing: 7,
                      children: widget.project.tags
                          .map((tag) => TagChip(tag))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
