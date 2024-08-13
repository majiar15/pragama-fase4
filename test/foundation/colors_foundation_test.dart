import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/store_design_system.dart';
import 'package:store_design_system/tokens/colors_token.dart';

void main() {
  group('StoreColorsFoundation', () {
    test('Primary and Secondary Colors should match StoreColorsToken values', () {
      expect(StoreColorsFoundation.primaryColor, equals(StoreColorsToken.primaryColor));
      expect(StoreColorsFoundation.secondaryColor, equals(StoreColorsToken.secondaryColor));
      expect(StoreColorsFoundation.darkSecondaryColor, equals(StoreColorsToken.primaryColor));
      expect(StoreColorsFoundation.onPrimaryColor, equals(StoreColorsToken.onPrimary));
      expect(StoreColorsFoundation.onSecondaryColor, equals(StoreColorsToken.onSecondary));
    });

    test('Background and Surface Colors should match StoreColorsToken values', () {
      expect(StoreColorsFoundation.backgroundColor, equals(StoreColorsToken.backgroundColor));
      expect(StoreColorsFoundation.darkBackgroundColor, equals(StoreColorsToken.darkColor));
      expect(StoreColorsFoundation.surfaceColor, equals(StoreColorsToken.surfaceColor));
      expect(StoreColorsFoundation.onSurfaceColor, equals(StoreColorsToken.onSurface));
    });

    test('Text Colors should match StoreColorsToken values', () {
      expect(StoreColorsFoundation.textColor, equals(StoreColorsToken.textColor));
      expect(StoreColorsFoundation.textPrimary, equals(StoreColorsToken.textPrimary));
      expect(StoreColorsFoundation.textEmphasize, equals(StoreColorsToken.textEmphasize));
      expect(StoreColorsFoundation.textHint, equals(StoreColorsToken.textHint));
      expect(StoreColorsFoundation.textDisabled, equals(StoreColorsToken.textDisabled));
      expect(StoreColorsFoundation.lightTextColors, equals(StoreColorsToken.lightTextColors));
    });

    test('Input, Error, Success, Warning, Info, and Gold Colors should match StoreColorsToken values', () {
      expect(StoreColorsFoundation.inputFillColor, equals(StoreColorsToken.inputFillColor));
      expect(StoreColorsFoundation.errorColor, equals(StoreColorsToken.errorColor));
      expect(StoreColorsFoundation.onErrorColor, equals(StoreColorsToken.onErrorColor));
      expect(StoreColorsFoundation.successColor, equals(StoreColorsToken.successColor));
      expect(StoreColorsFoundation.successLight, equals(StoreColorsToken.successLight));
      expect(StoreColorsFoundation.successDark, equals(StoreColorsToken.successDark));
      expect(StoreColorsFoundation.warningColor, equals(StoreColorsToken.warningColor));
      expect(StoreColorsFoundation.warningLight, equals(StoreColorsToken.warningLight));
      expect(StoreColorsFoundation.warningDark, equals(StoreColorsToken.warningDark));
      expect(StoreColorsFoundation.infoColor, equals(StoreColorsToken.infoColor));
      expect(StoreColorsFoundation.infoLight, equals(StoreColorsToken.infoLight));
      expect(StoreColorsFoundation.infoDark, equals(StoreColorsToken.infoDark));
      expect(StoreColorsFoundation.goldColor, equals(StoreColorsToken.goldColor));
    });
  });
}
