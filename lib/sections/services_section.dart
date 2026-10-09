import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/common/section_header.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const _services = [
    (
      Icons.phone_android_rounded,
      'Flutter development',
      'Production-ready iOS and Android apps from a single maintainable codebase.'
    ),
    (
      Icons.auto_awesome_rounded,
      'UI / UX implementation',
      'Pixel-aware interfaces, meaningful motion, and flows that feel natural.'
    ),
    (
      Icons.cloud_outlined,
      'Firebase & APIs',
      'Authentication, real-time data, notifications, and scalable integrations.'
    ),
    (
      Icons.rocket_launch_outlined,
      'Launch support',
      'Testing, release preparation, store submission, and post-launch fixes.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0A1B26),
      child: SectionWrapper(
        number: '04',
        eyebrow: 'HOW I CAN HELP',
        title: 'From idea',
        accent: 'to app store.',
        description:
            'A practical, focused process that keeps the product moving and the experience intentional.',
        child: LayoutBuilder(
          builder: (context, constraints) {
            final cols = constraints.maxWidth > 900
                ? 4
                : (constraints.maxWidth > 560 ? 2 : 1);
            final width = (constraints.maxWidth - 18 * (cols - 1)) / cols;

            return Wrap(
              spacing: 18,
              runSpacing: 18,
              children: _services
                  .map(
                    (item) => SizedBox(
                      width: width,
                      child: Container(
                        padding: const EdgeInsets.all(21),
                        constraints: const BoxConstraints(minHeight: 200),
                        decoration: BoxDecoration(
                          color: AppColors.panel,
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: Colors.white10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(item.$1, size: 22, color: AppColors.lime),
                            const SizedBox(height: 26),
                            Text(
                              item.$2,
                              style: const TextStyle(
                                color: AppColors.paper,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 9),
                            Text(
                              item.$3,
                              style: const TextStyle(
                                color: AppColors.muted,
                                fontSize: 11,
                                height: 1.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
