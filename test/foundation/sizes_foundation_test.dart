import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:store_design_system/tokens/sizes_token.dart';

void main() {
  group('StoreSizesFoundation', () {
    test('Padding values should match StoreSizesToken values', () {
      expect(StoreSizesFoundation.paddingS, equals(StoreSizesToken.paddingSmall));
      expect(StoreSizesFoundation.paddingM, equals(StoreSizesToken.paddingMedium));
      expect(StoreSizesFoundation.paddingL, equals(StoreSizesToken.paddingLarge));
      expect(StoreSizesFoundation.paddingXL, equals(StoreSizesToken.paddingExtraLarge));
    });

    test('Margin values should match StoreSizesToken values', () {
      expect(StoreSizesFoundation.marginS, equals(StoreSizesToken.marginSmall));
      expect(StoreSizesFoundation.marginM, equals(StoreSizesToken.marginMedium));
      expect(StoreSizesFoundation.marginL, equals(StoreSizesToken.marginLarge));
      expect(StoreSizesFoundation.marginXL, equals(StoreSizesToken.marginExtraLarge));
    });

    test('Height values should match StoreSizesToken values', () {
      expect(StoreSizesFoundation.heightXS, equals(StoreSizesToken.heightExtraSmall));
      expect(StoreSizesFoundation.heightS, equals(StoreSizesToken.heightSmall));
      expect(StoreSizesFoundation.heightM, equals(StoreSizesToken.heightMedium));
      expect(StoreSizesFoundation.heightL, equals(StoreSizesToken.heightLarge));
      expect(StoreSizesFoundation.heightXL, equals(StoreSizesToken.heightExtraLarge));
    });

    test('Width values should match StoreSizesToken values', () {
      expect(StoreSizesFoundation.widthXS, equals(StoreSizesToken.widthExtraSmall));
      expect(StoreSizesFoundation.widthS, equals(StoreSizesToken.widthSmall));
      expect(StoreSizesFoundation.widthM, equals(StoreSizesToken.widthMedium));
      expect(StoreSizesFoundation.widthL, equals(StoreSizesToken.widthLarge));
      expect(StoreSizesFoundation.widthXL, equals(StoreSizesToken.widthExtraLarge));
    });

    test('BorderRadius values should match StoreSizesToken values', () {
      expect(StoreSizesFoundation.borderRadiusS, equals(StoreSizesToken.borderRadiusSmall));
      expect(StoreSizesFoundation.borderRadiusM, equals(StoreSizesToken.borderRadiusMedium));
      expect(StoreSizesFoundation.borderRadiusL, equals(StoreSizesToken.borderRadiusLarge));
      expect(StoreSizesFoundation.borderRadiusSL, equals(StoreSizesToken.borderRadiusSmallLarge));
      expect(StoreSizesFoundation.borderRadiusXL, equals(StoreSizesToken.borderRadiusExtraLarge));
    });

    test('Elevation values should match StoreSizesToken values', () {
      expect(StoreSizesFoundation.elevationLow, equals(StoreSizesToken.elevationLow));
      expect(StoreSizesFoundation.elevationMedium, equals(StoreSizesToken.elevationMedium));
      expect(StoreSizesFoundation.elevationHigh, equals(StoreSizesToken.elevationHigh));
      expect(StoreSizesFoundation.elevationExtraHigh, equals(StoreSizesToken.elevationExtraHigh));
    });
  });
}
