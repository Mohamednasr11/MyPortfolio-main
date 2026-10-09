import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/common/max_width_container.dart';

class StatsStripSection extends StatelessWidget {
  const StatsStripSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0A1B26),
        border: Border.symmetric(
          horizontal: BorderSide(color: Color(0x223F6269)),
        ),
      ),
      child: MaxWidthContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
          child: LayoutBuilder(
            builder: (context, constraints) {
              const metrics = [
                _StripMetric(value: '10+', label: 'PRODUCTS DELIVERED'),
                _StripMetric(value: '95%', label: 'FLUTTER & DART CONFIDENCE'),
                _StripMetric(value: '∞', label: 'CARE FOR THE DETAILS'),
              ];
              const quote = Text(
                '“Good code should feel invisible. The experience should feel effortless.”',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 12,
                  height: 1.6,
                ),
              );

              if (constraints.maxWidth < 760) {
                return const Wrap(
                  spacing: 28,
                  runSpacing: 20,
                  children: [
                    ...metrics,
                    SizedBox(width: 250, child: quote),
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(child: metrics[0]),
                  const SizedBox(width: 18),
                  Expanded(child: metrics[1]),
                  const SizedBox(width: 18),
                  Expanded(child: metrics[2]),
                  const SizedBox(width: 24),
                  Expanded(flex: 2, child: quote),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _StripMetric extends StatelessWidget {
  final String value, label;

  const _StripMetric({required this.value, required this.label});

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
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 9,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
