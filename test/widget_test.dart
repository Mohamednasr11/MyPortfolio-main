import 'package:flutter_test/flutter_test.dart';
import 'package:mohamed_nasr_portfolio/main.dart';

void main() {
  testWidgets('portfolio renders the main sections', (tester) async {
    await tester.pumpWidget(const MohamedPortfolioApp());

    expect(find.text('Mohamed'), findsWidgets);
    expect(find.text('SELECTED WORK'), findsOneWidget);
    expect(find.text('INTERACTION PLAYGROUND'), findsOneWidget);
    expect(find.text('HOW I CAN HELP'), findsOneWidget);
    expect(find.text('HAVE A PROJECT IN MIND?'), findsOneWidget);
  });
}
