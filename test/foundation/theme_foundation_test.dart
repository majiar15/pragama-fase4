import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_design_system/foundation/colors_foundation.dart';
import 'package:store_design_system/foundation/typography_foundation.dart';
import 'package:store_design_system/foundation/theme_foundation.dart';
void main() {
  group('Theme Foundation', () {
    test('Light Theme Foundation has correct primary color', () {
      expect(ligthThemeFoundation.primaryColor, StoreColorsFoundation.primaryColor);
    });

    test('Dark Theme Foundation has correct primary color', () {
      expect(darkThemeFoundation.primaryColor, StoreColorsFoundation.primaryColor);
    });

    test('Light Theme Foundation has correct TextTheme', () {
      final TextTheme textTheme = ligthThemeFoundation.textTheme;

      expect(textTheme.displayLarge!.fontFamily, StoreTypographyFoundation.familyHeadings);
      expect(textTheme.displayLarge!.fontSize, StoreTypographyFoundation.fontSizeH1);
      expect(textTheme.displayLarge!.fontWeight, FontWeight.w700);
      expect(textTheme.displayLarge!.color, StoreColorsFoundation.textColor);

      expect(textTheme.displayMedium!.fontFamily, StoreTypographyFoundation.familyHeadings);
      expect(textTheme.displayMedium!.fontSize, StoreTypographyFoundation.fontSizeH2);
      expect(textTheme.displayMedium!.fontWeight, FontWeight.w900);
      expect(textTheme.displayMedium!.color, StoreColorsFoundation.textColor);

      expect(textTheme.displaySmall!.fontFamily, StoreTypographyFoundation.familyHeadings);
      expect(textTheme.displaySmall!.fontSize, StoreTypographyFoundation.fontSizeH3);
      expect(textTheme.displaySmall!.fontWeight, FontWeight.w400);
      expect(textTheme.displaySmall!.color, StoreColorsFoundation.textColor);

    });

    test('Dark Theme Foundation has correct TextTheme', () {
      final TextTheme textTheme = darkThemeFoundation.textTheme;

      expect(textTheme.displayLarge!.fontFamily, StoreTypographyFoundation.familyHeadings);
      expect(textTheme.displayLarge!.fontSize, StoreTypographyFoundation.fontSizeH1);
      expect(textTheme.displayLarge!.fontWeight, FontWeight.w700);
      expect(textTheme.displayLarge!.color, StoreColorsFoundation.lightTextColors);

      expect(textTheme.displayMedium!.fontFamily, StoreTypographyFoundation.familyHeadings);
      expect(textTheme.displayMedium!.fontSize, StoreTypographyFoundation.fontSizeH2);
      expect(textTheme.displayMedium!.fontWeight, FontWeight.w900);
      expect(textTheme.displayMedium!.color, StoreColorsFoundation.lightTextColors);

      expect(textTheme.displaySmall!.fontFamily, StoreTypographyFoundation.familyHeadings);
      expect(textTheme.displaySmall!.fontSize, StoreTypographyFoundation.fontSizeH3);
      expect(textTheme.displaySmall!.fontWeight, FontWeight.w400);
      expect(textTheme.displaySmall!.color, StoreColorsFoundation.lightTextColors);

    });

    test('Light Theme Foundation has correct ColorScheme', () {
      final ColorScheme colorScheme = ligthThemeFoundation.colorScheme;

      expect(colorScheme.primary, StoreColorsFoundation.primaryColor);
      expect(colorScheme.secondary, StoreColorsFoundation.secondaryColor);
      expect(colorScheme.surface, StoreColorsFoundation.surfaceColor);
      expect(colorScheme.error, StoreColorsFoundation.errorColor);
      expect(colorScheme.onPrimary, StoreColorsFoundation.onPrimaryColor);
      expect(colorScheme.onSecondary, StoreColorsFoundation.onSecondaryColor);
      expect(colorScheme.onSurface, StoreColorsFoundation.onSurfaceColor);
      expect(colorScheme.onError, StoreColorsFoundation.onErrorColor);
    });

    test('Dark Theme Foundation has correct ColorScheme', () {
      final ColorScheme colorScheme = darkThemeFoundation.colorScheme;

      expect(colorScheme.primary, StoreColorsFoundation.primaryColor);
      expect(colorScheme.secondary, StoreColorsFoundation.secondaryColor);
      expect(colorScheme.surface, StoreColorsFoundation.darkBackgroundColor);
      expect(colorScheme.error, StoreColorsFoundation.errorColor);
      expect(colorScheme.onPrimary, StoreColorsFoundation.onPrimaryColor);
      expect(colorScheme.onSecondary, StoreColorsFoundation.onSecondaryColor);
      expect(colorScheme.onSurface, StoreColorsFoundation.onSurfaceColor);
      expect(colorScheme.onError, StoreColorsFoundation.onErrorColor);
    });
  });
}
