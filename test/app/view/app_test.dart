import 'package:flutter_test/flutter_test.dart';
import 'package:smart_ix_takehome/src/feature/app/app.dart';
import 'package:smart_ix_takehome/src/feature/authentication/presentation/pages/login_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
