import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class NavItem extends StatefulWidget {
  final String name;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          style: TextStyle(
            color: _hovered ? AppColors.lime : AppColors.muted,
            fontSize: 12,
            fontWeight: _hovered ? FontWeight.w700 : FontWeight.w500,
          ),
          child: Text(widget.name),
        ),
      ),
    );
  }
}
