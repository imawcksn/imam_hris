import 'package:flutter_test/flutter_test.dart';
import 'package:imam_very_good_map/app/app.dart';
import 'package:imam_very_good_map/src/features/auth/presentation/pages/login_page.dart';

void main() {
  group('App', () {
    testWidgets('renders LoginPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
