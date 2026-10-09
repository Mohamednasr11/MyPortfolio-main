import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/common/buttons.dart';
import '../widgets/common/max_width_container.dart';

class HeroSection extends StatelessWidget {
  final ValueChanged<String> onNavigate;

  const HeroSection({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return MaxWidthContainer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 72, 28, 78),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final stacked = constraints.maxWidth < 760;
            final text = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Eyebrow('FLUTTER DEVELOPER  ·  OPEN TO WORK'),
                const SizedBox(height: 25),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'I build digital\nexperiences '),
                      TextSpan(
                        text: 'people keep.',
                        style: TextStyle(color: AppColors.lime),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    color: AppColors.paper,
                    fontSize: math.min(
                      78,
                      constraints.maxWidth * (stacked ? 0.115 : 0.088),
                    ),
                    height: 0.99,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -4.3,
                  ),
                ),
                const SizedBox(height: 23),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: const Text(
                    "I'm Mohamed, a Flutter developer turning ideas into fast, reliable, and beautifully considered mobile products for iOS and Android.",
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 15,
                      height: 1.85,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Wrap(
                  spacing: 14,
                  runSpacing: 12,
                  children: [
                    PrimaryButton(
                      label: 'Explore my work',
                      icon: Icons.arrow_outward_rounded,
                      onPressed: () => onNavigate('Projects'),
                    ),
                    QuietButton(
                      label: 'Let’s talk',
                      onPressed: () => onNavigate('Contact'),
                    ),
                  ],
                ),
                const SizedBox(height: 43),
                const Wrap(
                  spacing: 32,
                  runSpacing: 18,
                  children: [
                    _HeroStat(value: '10+', label: 'projects shipped'),
                    _HeroStat(value: '1.5y', label: 'hands-on experience'),
                    _HeroStat(value: '2x', label: 'platforms, one codebase'),
                  ],
                ),
              ],
            );

            const portrait = _PortraitCard();

            if (stacked) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [text, const SizedBox(height: 48), portrait],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 11, child: text),
                const SizedBox(width: 40),
                Expanded(flex: 9, child: portrait),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Eyebrow extends StatelessWidget {
  final String text;
  const _Eyebrow(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.lime,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: AppColors.lime, blurRadius: 9)],
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 10,
            letterSpacing: 1.3,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _HeroStat extends StatelessWidget {
  final String value;
  final String label;

  const _HeroStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppColors.lime,
            fontSize: 29,
            height: 1,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 7),
        Text(label, style: const TextStyle(color: AppColors.muted, fontSize: 10)),
      ],
    );
  }
}

class _PortraitCard extends StatelessWidget {
  const _PortraitCard();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 330,
                height: 330,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.withAlphaOpacity(AppColors.lime, 0.25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.withAlphaOpacity(AppColors.lime, 0.08),
                      blurRadius: 80,
                      spreadRadius: 30,
                    ),
                  ],
                ),
              ),
              Container(
                width: 286,
                height: 286,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.withAlphaOpacity(AppColors.cyan, 0.22),
                    width: 1.2,
                  ),
                ),
              ),
              Container(
                width: 244,
                height: 244,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.withAlphaOpacity(AppColors.lime, 0.68),
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  'mee.jpg',
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.2),
                ),
              ),
              const _FloatingChip(
                text: 'Flutter · Dart',
                icon: Icons.code_rounded,
                top: 65,
                right: 3,
              ),
              const _FloatingChip(
                text: 'iOS + Android',
                icon: Icons.phone_iphone_rounded,
                bottom: 68,
                left: 0,
              ),
              const Positioned(bottom: 23, right: 5, child: _LivePill()),
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingChip extends StatelessWidget {
  final String text;
  final IconData icon;
  final double? top, right, bottom, left;

  const _FloatingChip({
    required this.text,
    required this.icon,
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.panel,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: AppColors.withAlphaOpacity(AppColors.lime, 0.25),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 15, color: AppColors.lime),
              const SizedBox(width: 7),
              Text(
                text,
                style: const TextStyle(
                  color: AppColors.paper,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LivePill extends StatelessWidget {
  const _LivePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.panel,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white12),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PulseDot(),
          SizedBox(width: 7),
          Text(
            'Available for work',
            style: TextStyle(color: AppColors.paper, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class _PulseDot extends StatefulWidget {
  const _PulseDot();

  @override
  State<_PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<_PulseDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.35, end: 1.0).animate(_controller),
      child: Container(
        width: 7,
        height: 7,
        decoration: const BoxDecoration(
          color: AppColors.lime,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
