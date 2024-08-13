
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:store_design_system/tokens/spacing_token.dart';

void main() {
  group('StoreSpacingFoundation', () {
    test('Spacing values should match StoreSpacingToken values', () {
      expect(StoreSpacingFoundation.xxs, equals(StoreSpacingToken.spaceXXS));
      expect(StoreSpacingFoundation.xs, equals(StoreSpacingToken.spaceXS));
      expect(StoreSpacingFoundation.s, equals(StoreSpacingToken.spaceSM));
      expect(StoreSpacingFoundation.sl, equals(StoreSpacingToken.spaceSL));
      expect(StoreSpacingFoundation.md, equals(StoreSpacingToken.spaceMD));
      expect(StoreSpacingFoundation.lg, equals(StoreSpacingToken.spaceLG));
      expect(StoreSpacingFoundation.xl, equals(StoreSpacingToken.spaceXL));
      expect(StoreSpacingFoundation.xxl, equals(StoreSpacingToken.spaceXXL));
    });
  });
}
