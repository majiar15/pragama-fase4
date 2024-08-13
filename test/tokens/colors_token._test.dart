import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/tokens/colors_token.dart';

void main() {
  group('StoreColorsToken', () {
    test('should have correct primary color', () {
      expect(StoreColorsToken.primaryColor, const Color(0xFFFA7189));
    });

    test('should have correct secondary color', () {
      expect(StoreColorsToken.secondaryColor, const Color(0xFF4392F9));
    });

    test('should have correct dark color', () {
      expect(StoreColorsToken.darkColor, const Color(0xFF000000));
    });

    test('should have correct onPrimary color', () {
      expect(StoreColorsToken.onPrimary, const Color(0xFFFFFFFF));
    });

    test('should have correct onSecondary color', () {
      expect(StoreColorsToken.onSecondary, const Color(0xFFFFFFFF));
    });

    test('should have correct background color', () {
      expect(StoreColorsToken.backgroundColor, const Color(0xFFF5F5F5));
    });

    test('should have correct surface color', () {
      expect(StoreColorsToken.surfaceColor, const Color(0xFFFFFFFF));
    });

    test('should have correct onSurface color', () {
      expect(StoreColorsToken.onSurface, const Color(0xFF000000));
    });

    test('should have correct text color', () {
      expect(StoreColorsToken.textColor, const Color(0xFF000000));
    });

    test('should have correct textPrimary color', () {
      expect(StoreColorsToken.textPrimary, const Color(0xFF212121));
    });

    test('should have correct textEmphasize color', () {
      expect(StoreColorsToken.textEmphasize, const Color(0xFFFA7189));
    });

    test('should have correct textHint color', () {
      expect(StoreColorsToken.textHint, const Color(0xFF9E9E9E));
    });

    test('should have correct textDisabled color', () {
      expect(StoreColorsToken.textDisabled, const Color(0xFFBDBDBD));
    });

    test('should have correct lightTextColors color', () {
      expect(StoreColorsToken.lightTextColors, const Color(0xFFE6E7E8));
    });

    test('should have correct inputFillColor color', () {
      expect(StoreColorsToken.inputFillColor, const Color.fromARGB(255, 234, 234, 235));
    });

    test('should have correct error color', () {
      expect(StoreColorsToken.errorColor, const Color(0xFFB00020));
    });

    test('should have correct onErrorColor color', () {
      expect(StoreColorsToken.onErrorColor, const Color(0xFFFFFFFF));
    });

    test('should have correct successColor color', () {
      expect(StoreColorsToken.successColor, const Color(0xFF4CAF50));
    });

    test('should have correct successLight color', () {
      expect(StoreColorsToken.successLight, const Color(0xFF80E27E));
    });

    test('should have correct successDark color', () {
      expect(StoreColorsToken.successDark, const Color(0xFF087F23));
    });

    test('should have correct warningColor color', () {
      expect(StoreColorsToken.warningColor, const Color(0xFFFFC107));
    });

    test('should have correct warningLight color', () {
      expect(StoreColorsToken.warningLight, const Color(0xFFFFD54F));
    });

    test('should have correct warningDark color', () {
      expect(StoreColorsToken.warningDark, const Color(0xFFFFA000));
    });

    test('should have correct infoColor color', () {
      expect(StoreColorsToken.infoColor, const Color(0xFF2196F3));
    });

    test('should have correct infoLight color', () {
      expect(StoreColorsToken.infoLight, const Color(0xFF64B5F6));
    });

    test('should have correct infoDark color', () {
      expect(StoreColorsToken.infoDark, const Color(0xFF1976D2));
    });

    test('should have correct goldColor color', () {
      expect(StoreColorsToken.goldColor, const Color(0xFFEDB310));
    });
  });
}
