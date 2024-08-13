import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/tokens/sizes_token.dart';

void main() {
  group('StoreSizesToken', () {
    
    test('should have correct paddingSmall', () {
      expect(StoreSizesToken.paddingSmall, 8.0);
    });

    test('should have correct paddingMedium', () {
      expect(StoreSizesToken.paddingMedium, 16.0);
    });

    test('should have correct paddingLarge', () {
      expect(StoreSizesToken.paddingLarge, 24.0);
    });

    test('should have correct paddingExtraLarge', () {
      expect(StoreSizesToken.paddingExtraLarge, 32.0);
    });

    
    test('should have correct marginSmall', () {
      expect(StoreSizesToken.marginSmall, 8.0);
    });

    test('should have correct marginMedium', () {
      expect(StoreSizesToken.marginMedium, 16.0);
    });

    test('should have correct marginLarge', () {
      expect(StoreSizesToken.marginLarge, 24.0);
    });

    test('should have correct marginExtraLarge', () {
      expect(StoreSizesToken.marginExtraLarge, 32.0);
    });

    
    test('should have correct heightExtraSmall', () {
      expect(StoreSizesToken.heightExtraSmall, 32.0);
    });

    test('should have correct heightSmall', () {
      expect(StoreSizesToken.heightSmall, 40.0);
    });

    test('should have correct heightMedium', () {
      expect(StoreSizesToken.heightMedium, 80.0);
    });

    test('should have correct heightLarge', () {
      expect(StoreSizesToken.heightLarge, 120.0);
    });

    test('should have correct heightExtraLarge', () {
      expect(StoreSizesToken.heightExtraLarge, 160.0);
    });

    
    test('should have correct widthExtraSmall', () {
      expect(StoreSizesToken.widthExtraSmall, 32.0);
    });

    test('should have correct widthSmall', () {
      expect(StoreSizesToken.widthSmall, 40.0);
    });

    test('should have correct widthMedium', () {
      expect(StoreSizesToken.widthMedium, 80.0);
    });

    test('should have correct widthLarge', () {
      expect(StoreSizesToken.widthLarge, 120.0);
    });

    test('should have correct widthExtraLarge', () {
      expect(StoreSizesToken.widthExtraLarge, 160.0);
    });

    
    test('should have correct borderRadiusSmall', () {
      expect(StoreSizesToken.borderRadiusSmall, 4.0);
    });

    test('should have correct borderRadiusMedium', () {
      expect(StoreSizesToken.borderRadiusMedium, 8.0);
    });

    test('should have correct borderRadiusLarge', () {
      expect(StoreSizesToken.borderRadiusLarge, 16.0);
    });

    test('should have correct borderRadiusSmallLarge', () {
      expect(StoreSizesToken.borderRadiusSmallLarge, 21.0);
    });

    test('should have correct borderRadiusExtraLarge', () {
      expect(StoreSizesToken.borderRadiusExtraLarge, 32.0);
    });

    
    test('should have correct elevationLow', () {
      expect(StoreSizesToken.elevationLow, 2.0);
    });

    test('should have correct elevationMedium', () {
      expect(StoreSizesToken.elevationMedium, 6.0);
    });

    test('should have correct elevationHigh', () {
      expect(StoreSizesToken.elevationHigh, 12.0);
    });

    test('should have correct elevationExtraHigh', () {
      expect(StoreSizesToken.elevationExtraHigh, 24.0);
    });
  });
}
