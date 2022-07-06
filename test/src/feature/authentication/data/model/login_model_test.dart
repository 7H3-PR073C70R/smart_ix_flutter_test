import 'package:flutter_test/flutter_test.dart';
import 'package:smart_ix_takehome/src/feature/authentication/data/model/login_model.dart';

void main() {
  group('login param model ...', () {
    test('Verify that the right data is returned from the [toJson]', () {
      final model = LoginParamModel(
        email: 'example@example.com',
        password: '1234567890',
      );

      expect(
        model.toJson(),
        equals(
          {
            'email': 'example@example.com',
            'password': '1234567890',
          },
        ),
      );
    });
  });
}
