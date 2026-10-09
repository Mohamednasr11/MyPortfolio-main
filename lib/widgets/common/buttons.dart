import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      label: Text(
        label,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
      ),
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.lime,
        foregroundColor: AppColors.ink,
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
    );
  }
}

class QuietButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const QuietButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      iconAlignment: IconAlignment.end,
      icon: const Icon(Icons.arrow_downward_rounded, size: 14),
      label: Text(label, style: const TextStyle(color: AppColors.paper, fontSize: 11)),
      style: TextButton.styleFrom(foregroundColor: AppColors.paper),
    );
  }
}
