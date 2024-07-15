import 'package:flutter/material.dart';
import 'package:store_desing_system/foundation/colors_foundation.dart';
import 'package:store_desing_system/foundation/typography_foundation.dart';

final ligthThemeFoundation = ThemeData(
  primaryColor: StoreColorsFoundation.primaryColor,
  useMaterial3: true,
  scaffoldBackgroundColor: StoreColorsFoundation.backgroundColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w700,
      fontSize: StoreTypographyFoundation.fontSizeH1,
      color: StoreColorsFoundation.textColor,
    ),
    displayMedium: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w900,
      fontSize: StoreTypographyFoundation.fontSizeH2,
      color: StoreColorsFoundation.textColor,
    ),
    displaySmall: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w400,
      fontSize: StoreTypographyFoundation.fontSizeH3,
      color: StoreColorsFoundation.textColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w400,
      fontSize: StoreTypographyFoundation.fontSizeH4,
      color: StoreColorsFoundation.textColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w400,
      fontSize: StoreTypographyFoundation.fontSizeH5,
      color: StoreColorsFoundation.textColor,
    ),
    titleLarge: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w400,
      fontSize: StoreTypographyFoundation.fontSizeH6,
      color: StoreColorsFoundation.textColor,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: StoreColorsFoundation.primaryColor,
    secondary: StoreColorsFoundation.secondaryColor,
    surface: StoreColorsFoundation.surfaceColor,
    error: StoreColorsFoundation.errorColor,
    onPrimary: StoreColorsFoundation.onPrimaryColor,
    onSecondary: StoreColorsFoundation.onSecondaryColor,
    onSurface: StoreColorsFoundation.onSurfaceColor,
    onError: StoreColorsFoundation.onErrorColor,
  ),
);

final darkThemeFoundation = ThemeData(
  primaryColor: StoreColorsFoundation.primaryColor,
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w700,
      fontSize: StoreTypographyFoundation.fontSizeH1,
      color: StoreColorsFoundation.lightTextColors,
    ),
    displayMedium: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w900,
      fontSize: StoreTypographyFoundation.fontSizeH2,
      color: StoreColorsFoundation.lightTextColors,
    ),
    displaySmall: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w400,
      fontSize: StoreTypographyFoundation.fontSizeH3,
      color: StoreColorsFoundation.lightTextColors,
    ),
    headlineMedium: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w400,
      fontSize: StoreTypographyFoundation.fontSizeH4,
      color: StoreColorsFoundation.textColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w400,
      fontSize: StoreTypographyFoundation.fontSizeH5,
      color: StoreColorsFoundation.textColor,
    ),
    titleLarge: TextStyle(
      fontFamily: StoreTypographyFoundation.familyHeadings,
      fontWeight: FontWeight.w400,
      fontSize: StoreTypographyFoundation.fontSizeH6,
      color: StoreColorsFoundation.lightTextColors,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: StoreColorsFoundation.primaryColor,
    secondary: StoreColorsFoundation.secondaryColor,
    surface: StoreColorsFoundation.darkBackgroundColor,
    error: StoreColorsFoundation.errorColor,
    onPrimary: StoreColorsFoundation.onPrimaryColor,
    onSecondary: StoreColorsFoundation.onSecondaryColor,
    onSurface: StoreColorsFoundation.onSurfaceColor,
    onError: StoreColorsFoundation.onErrorColor,
  ),
);
