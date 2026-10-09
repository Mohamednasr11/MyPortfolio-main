import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/utils/url_launcher_utils.dart';
import '../data/portfolio_data.dart';
import '../widgets/common/buttons.dart';
import '../widgets/common/section_header.dart';
import '../widgets/common/tag_chip.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.panelLight,
      child: SectionWrapper(
        number: '01',
        eyebrow: 'A LITTLE ABOUT ME',
        title: 'Building apps',
        accent: 'that feel right.',
        description:
            'Clean architecture, thoughtful interactions, and a product mindset — all the ingredients for mobile experiences people enjoy.',
        child: LayoutBuilder(
          builder: (context, constraints) {
            final narrow = constraints.maxWidth < 820;
            return Wrap(
              spacing: 48,
              runSpacing: 36,
              children: [
                SizedBox(
                  width: narrow
                      ? constraints.maxWidth
                      : constraints.maxWidth * 0.38,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "I'm a Flutter developer with 1.5+ years of hands-on experience building apps for startups and businesses. I care deeply about maintainable code, smooth animations, and interfaces that feel native on every device.",
                        style: TextStyle(
                          color: AppColors.paper,
                          fontSize: 14,
                          height: 1.9,
                        ),
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        label: 'Say hello',
                        icon: Icons.arrow_outward_rounded,
                        onPressed: () =>
                            UrlLauncherUtils.openEmail(PortfolioData.email),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: narrow
                      ? constraints.maxWidth
                      : constraints.maxWidth * 0.48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CORE SKILLS',
                        style: TextStyle(
                          color: AppColors.lime,
                          fontSize: 10,
                          letterSpacing: 1.6,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const _SkillBar(label: 'Flutter & Dart', value: 0.95),
                      const _SkillBar(label: 'State management', value: 0.88),
                      const _SkillBar(
                          label: 'Firebase & REST APIs', value: 0.85),
                      const _SkillBar(label: 'UI / UX & animation', value: 0.90),
                      const SizedBox(height: 23),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: PortfolioData.skills
                            .map((skill) => TagChip(skill))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  final String label;
  final double value;

  const _SkillBar({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(color: AppColors.paper, fontSize: 11),
                ),
              ),
              Text(
                '${(value * 100).round()}%',
                style: const TextStyle(color: AppColors.lime, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 4,
              backgroundColor: const Color(0xFF284A56),
              color: AppColors.lime,
            ),
          ),
        ],
      ),
    );
  }
}
