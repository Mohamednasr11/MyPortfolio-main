import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../common/brand_logo.dart';

import 'nav_item.dart';

class HeaderNavBar extends StatelessWidget {
  final ValueChanged<String> onNavigate;

  const HeaderNavBar({super.key, required this.onNavigate});

  static const _navItems = ['About', 'Projects', 'Motion lab', 'Services', 'Contact'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1180),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 690;
              return Row(
                children: [
                  const BrandLogo(),
                  const Spacer(),
                  if (!compact)
                    ..._navItems.map(
                      (name) => Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: NavItem(name: name, onTap: () => onNavigate(name)),
                      ),
                    ),
                  if (compact)
                    PopupMenuButton<String>(
                      tooltip: 'Navigate',
                      icon: const Icon(Icons.menu_rounded, color: AppColors.lime),
                      color: AppColors.panelLight,
                      onSelected: onNavigate,
                      itemBuilder: (context) => _navItems
                          .map(
                            (name) => PopupMenuItem(
                              value: name,
                              child: Text(name),
                            ),
                          )
                          .toList(),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
