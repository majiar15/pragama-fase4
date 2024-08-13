import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/foundation/typography_foundation.dart';
import 'package:store_design_system/tokens/typography_token.dart';

void main() {
  group('StoreTypographyFoundation', () {
    test('Correct font families are used', () {
      expect(StoreTypographyFoundation.familyHeadings, StoreTypographyToken.familyOpenSans);
      expect(StoreTypographyFoundation.familyBody, StoreTypographyToken.familyRoboto);
    });

    test('Correct font sizes are used', () {
      expect(StoreTypographyFoundation.fontSizeH1, StoreTypographyToken.fontSizeExtraExtraLarge);
      expect(StoreTypographyFoundation.fontSizeH2, StoreTypographyToken.fontSizeExtraLarge);
      expect(StoreTypographyFoundation.fontSizeH3, StoreTypographyToken.fontSizeLarge);
      expect(StoreTypographyFoundation.fontSizeH4, StoreTypographyToken.fontSizeMedium);
      expect(StoreTypographyFoundation.fontSizeH5, StoreTypographyToken.fontSizeSmall);
      expect(StoreTypographyFoundation.fontSizeH6, StoreTypographyToken.fontSizeExtraSmall);
      expect(StoreTypographyFoundation.fontSizeBodyText, StoreTypographyToken.fontSizeExtraSmall);
      expect(StoreTypographyFoundation.fontSizeLabel, StoreTypographyToken.fontSizeExtraSmall);
      expect(StoreTypographyFoundation.fontSizeLink, StoreTypographyToken.fontSizeExtraSmall);
      expect(StoreTypographyFoundation.fontSizeSmall, StoreTypographyToken.fontSizeExtraSmall);
      expect(StoreTypographyFoundation.fontSizeXSmall, StoreTypographyToken.fontSizeExtraSmall);
      expect(StoreTypographyFoundation.fontSizeUpSmall, StoreTypographyToken.fontSizeUpperSmall);
    });

    test('Correct font weights are used', () {
      expect(StoreTypographyFoundation.fontWeightLight, StoreTypographyToken.fontWeightLight);
      expect(StoreTypographyFoundation.fontWeightRegular, StoreTypographyToken.fontWeightRegular);
      expect(StoreTypographyFoundation.fontWeightMedium, StoreTypographyToken.fontWeightMedium);
      expect(StoreTypographyFoundation.fontWeightBold, StoreTypographyToken.fontWeightBold);
    });

    test('Correct line heights are used', () {
      expect(StoreTypographyFoundation.lineHeightSmall, StoreTypographyToken.lineHeightSmall);
      expect(StoreTypographyFoundation.lineHeightMedium, StoreTypographyToken.lineHeightMedium);
      expect(StoreTypographyFoundation.lineHeightLarge, StoreTypographyToken.lineHeightLarge);
    });
  });
}
