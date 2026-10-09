import '../models/project.dart';

class PortfolioData {
  const PortfolioData._();

  static const String name = 'Mohamed Nasr Eldeen';
  static const String title = 'Flutter Developer';
  static const String email = 'mohamed.nasr.flutter@gmail.com';
  static const String phone = '201096074334';
  static const String githubUrl = 'https://github.com/Mohamednasr11';
  static const String linkedinUrl =
      'https://www.linkedin.com/in/mohamed-nasr-eldeen-3057b8240/';

  static const List<Project> projects = [
    Project(
      id: 'matjarkom',
      name: 'Matjarkom',
      category: 'E-COMMERCE · MOBILE APP',
      image: 'assets/متجركم/matqarqom_thumbnail.png',
      headline: 'تطبيق تسوق إلكتروني ذكي مدعوم بالذكاء الاصطناعي',
      subtitle: 'Smart E-Commerce with AI Assistant & Fast Checkout',
      description:
          'A modern e-commerce experience with AI chatbot support, location-aware delivery tracking, and a focused checkout flow.',
      tags: ['Flutter', 'Firebase', 'Google Maps', 'AI'],
      gallery: [
        'assets/متجركم/dark_home.png',
        'assets/متجركم/dark_category.png',
        'assets/متجركم/dark_payment_screen.png',
        'assets/متجركم/dark_home.png',
        'assets/متجركم/dark_category.png',
      ],
    ),
    Project(
      id: 'trustsafe',
      name: 'TrustSafe',
      category: 'ENTERPRISE · DOCUMENT MANAGEMENT',
      image: 'assets/trustsafe.png',
      headline: 'إدارة وثائق المؤسسات بأعلى معايير الأمان',
      subtitle: 'Secure Enterprise Document Management & Workflows',
      description:
          'A secure document management experience designed around access controls, clear reporting, and workflows that help teams move with confidence.',
      tags: ['Flutter', 'Enterprise', 'Security'],
      gallery: [
        'assets/trustsafe_0.jpeg',
        'assets/trustsafe_3.jpeg',
        'assets/trustsafe_6.jpeg',
        'assets/trustsafe_0.jpeg',
        'assets/trustsafe_3.jpeg',
      ],
    ),
    Project(
      id: 'brew_and_bloom',
      name: 'Brew & Bloom',
      category: 'HOSPITALITY · ORDERING',
      image: 'assets/coffeeshop.png',
      headline: 'تجربة طلب القهوة الفاخرة والمكافآت',
      subtitle: 'Premium Coffee Ordering & Artisanal Brew Selection',
      description:
          'A premium coffee ordering concept with custom brewing options, loyalty rewards, and a delivery flow that keeps customers informed.',
      tags: ['Flutter', 'UI / UX', 'Dart'],
      gallery: [
        'assets/High-Fidelity ( Home ).png',
        'assets/High-Fidelity ( Delivery ).png',
        'assets/High-Fidelity ( Order ).png',
        'assets/High-Fidelity ( Home ).png',
        'assets/High-Fidelity ( Delivery ).png',
      ],
    ),
    Project(
      id: 'build_guard',
      name: 'Build-Guard',
      category: 'CONSTRUCTION · SAFETY',
      image: 'assets/build_gaurd_assets/Build-guard.png',
      headline: 'إدارة وإرشادات السلامة في مواقع البناء بالذكاء الاصطناعي',
      subtitle: 'Real-time AI Site Safety Monitoring & Incident Reports',
      description:
          'An AI-powered construction safety and management product for real-time monitoring, issue reporting, and better decisions on site.',
      tags: ['Flutter', 'AI', 'Firebase'],
      gallery: [
        'assets/build_gaurd_assets/Home.png',
        'assets/build_gaurd_assets/Scan.png',
        'assets/build_gaurd_assets/ReportsLibrary.png',
        'assets/build_gaurd_assets/Home.png',
        'assets/build_gaurd_assets/Scan.png',
      ],
    ),
  ];

  static const List<String> skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'BLoC',
    'REST API',
    'SQLite',
    'Git',
    'Figma',
    'FCM',
    'iOS',
    'Android',
  ];
}
