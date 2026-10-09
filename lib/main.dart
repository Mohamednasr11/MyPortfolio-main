import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'views/portfolio_page.dart';

void main() => runApp(const MohamedPortfolioApp());

class MohamedPortfolioApp extends StatelessWidget {
  const MohamedPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohamed Nasr Eldeen — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioPage(),
    );
  }
}
