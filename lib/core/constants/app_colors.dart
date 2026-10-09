import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color ink = Color(0xFF07131C);
  static const Color panel = Color(0xFF0C202C);
  static const Color panelLight = Color(0xFF102B39);
  static const Color lime = Color(0xFFB8F58F);
  static const Color cyan = Color(0xFF91DCF2);
  static const Color paper = Color(0xFFEDF2EE);
  static const Color muted = Color(0xFF91A5A9);
  static const Color border = Color(0x334D7478);
  static const Color cardBorder = Color(0x1AFFFFFF);

  // Goldie Mockup Frame Colors
  static const Color mockupBezelOuter = Color(0xFF1A2630);
  static const Color mockupBezelInner = Color(0xFF0F1820);
  static const Color mockupCameraPin = Color(0xFF080D11);
  static const Color mockupGlare = Color(0x12FFFFFF);

  /// Safe alpha color helper compatible across Flutter versions
  static Color withAlphaOpacity(Color color, double opacity) {
    return Color.fromARGB(
      (opacity * 255).round().clamp(0, 255).toInt(),
      // ignore: deprecated_member_use
      color.red,
      // ignore: deprecated_member_use
      color.green,
      // ignore: deprecated_member_use
      color.blue,
    );
  }
}
