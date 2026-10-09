import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/utils/url_launcher_utils.dart';
import '../data/portfolio_data.dart';
import '../widgets/common/buttons.dart';
import '../widgets/common/max_width_container.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxWidthContainer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 74, 28, 74),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1C4548), Color(0xFF153442)],
            ),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.withAlphaOpacity(AppColors.lime, 0.26),
            ),
          ),
          child: Column(
            children: [
              const Text(
                'HAVE A PROJECT IN MIND?',
                style: TextStyle(
                  color: AppColors.lime,
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 22),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: "Let's build something\n"),
                    TextSpan(
                      text: 'worth using.',
                      style: TextStyle(color: AppColors.lime),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.paper,
                  fontSize: 48,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tell me what you’re working on — even if it’s still just an idea.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFB4C9BC), fontSize: 12),
              ),
              const SizedBox(height: 25),
              PrimaryButton(
                label: PortfolioData.email,
                icon: Icons.mail_outline_rounded,
                onPressed: () =>
                    UrlLauncherUtils.openEmail(PortfolioData.email),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
