import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/tokens/typography_token.dart';

void main() {
  group('StoreTypographyToken', () {
    test('should have correct font family values', () {
      expect(StoreTypographyToken.familyCorben, 'Corben');
      expect(StoreTypographyToken.familyInter, 'Inter');
      expect(StoreTypographyToken.familyOpenSans, 'OpenSans');
      expect(StoreTypographyToken.familyRoboto, 'Roboto');
    });

    test('should have correct font size values', () {
      expect(StoreTypographyToken.fontSizeExtraSmall, 12.0);
      expect(StoreTypographyToken.fontSizeSmall, 16.0);
      expect(StoreTypographyToken.fontSizeUpperSmall, 18.0);
      expect(StoreTypographyToken.fontSizeMedium, 20.0);
      expect(StoreTypographyToken.fontSizeLarge, 24.0);
      expect(StoreTypographyToken.fontSizeExtraLarge, 34.0);
      expect(StoreTypographyToken.fontSizeExtraExtraLarge, 40.0);
    });

    test('should have correct font weight values', () {
      expect(StoreTypographyToken.fontWeightLight, FontWeight.w300);
      expect(StoreTypographyToken.fontWeightRegular, FontWeight.w400);
      expect(StoreTypographyToken.fontWeightMedium, FontWeight.w500);
      expect(StoreTypographyToken.fontWeightBold, FontWeight.w700);
    });

    test('should have correct line height values', () {
      expect(StoreTypographyToken.lineHeightSmall, 1.2);
      expect(StoreTypographyToken.lineHeightMedium, 1.5);
      expect(StoreTypographyToken.lineHeightLarge, 1.8);
    });
  });
}
