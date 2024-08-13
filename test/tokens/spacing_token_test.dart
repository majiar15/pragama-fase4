import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/tokens/spacing_token.dart';

void main() {
  group('StoreSpacingToken', () {
    test('should have correct spaceXXS', () {
      expect(StoreSpacingToken.spaceXXS, 3.0);
    });

    test('should have correct spaceXS', () {
      expect(StoreSpacingToken.spaceXS, 5.0);
    });

    test('should have correct spaceSM', () {
      expect(StoreSpacingToken.spaceSM, 8.0);
    });

    test('should have correct spaceSL', () {
      expect(StoreSpacingToken.spaceSL, 16.0);
    });

    test('should have correct spaceMD', () {
      expect(StoreSpacingToken.spaceMD, 21.0);
    });

    test('should have correct spaceLG', () {
      expect(StoreSpacingToken.spaceLG, 34.0);
    });

    test('should have correct spaceXL', () {
      expect(StoreSpacingToken.spaceXL, 55.0);
    });

    test('should have correct spaceXXL', () {
      expect(StoreSpacingToken.spaceXXL, 89.0);
    });
  });
}
