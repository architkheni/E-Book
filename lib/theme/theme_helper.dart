import 'package:flutter/material.dart';

import '../../core/app_export.dart';

String _appTheme = 'primary';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors(),
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme,
  };

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    _appTheme = newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
        '$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner',
      );
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
        '$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner',
      );
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      colorScheme: colorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.teal400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: appTheme.blueGray50,
          fontSize: getFontSize(
            32,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          color: appTheme.blueGray50,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.blueGray50,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w300,
        ),
        labelMedium: TextStyle(
          color: appTheme.blueGray50,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.blueGray50,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.blueGray50,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.blueGray50,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: getFontSize(
            24,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w700,
        ),
      ),
      visualDensity: VisualDensity.standard,
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    background: Color(0XFFA5998D),
    error: Color(0X1EFFFFFF),
    errorContainer: Color(0XFF40666B),
    inversePrimary: Color(0XFFA5998D),
    inverseSurface: Color(0X1EFFFFFF),
    onBackground: Color(0X00181919),
    onError: Color(0X7F303333),
    onErrorContainer: Color(0X00181919),
    onInverseSurface: Color(0X7F303333),
    onPrimary: Color(0X1EFFFFFF),
    onPrimaryContainer: Color(0X00181919),
    onSecondary: Color(0X00181919),
    onSecondaryContainer: Color(0X1EFFFFFF),
    onSurface: Color(0X00181919),
    onSurfaceVariant: Color(0X1EFFFFFF),
    onTertiary: Color(0X00181919),
    onTertiaryContainer: Color(0X1EFFFFFF),
    outline: Color(0X1EFFFFFF),
    // outlineVariant: Color(0XFFA5998D),
    primary: Color(0XFF303333),
    primaryContainer: Color(0XFFA5998D),
    // scrim: Color(0XFFA5998D),
    secondary: Color(0XFFA5998D),
    secondaryContainer: Color(0X7F303333),
    shadow: Color(0X1EFFFFFF),
    surface: Color(0XFFA5998D),
    surfaceTint: Color(0X1EFFFFFF),
    surfaceVariant: Color(0X7F303333),
    tertiary: Color(0XFFA5998D),
    tertiaryContainer: Color(0X7F303333),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => const Color(0XFF000000);
  // Blue
  Color get blueA400 => const Color(0XFF1877F2);
  // BlueGray
  Color get blueGray400 => const Color(0XFF888888);
  Color get blueGray50 => const Color(0XFFEAF4F4);
  Color get blueGray5001 => const Color(0XFFE9F3F3);
  Color get blueGray900 => const Color(0XFF303333);

  // Gray
  Color get gray300 => const Color(0XFFE6DFD5);
  Color get gray400 => const Color(0XFFC3CCCC);
  Color get gray500 => const Color(0XFF929999);
  Color get gray700 => const Color(0XFF616666);
  Color get gray50 => const Color(0XFFFAFAFA);
  Color get gray900 => const Color(0XFF232323);
  Color get gray50001 => const Color(0XFFA5998D);
  Color get gray90003 => const Color(0XFF181919);
  Color get gray90001 => const Color(0XFF1D201C);
  Color get grayTextfiled => const Color(0XFF272828);

  // Orange
  Color get orange200 => const Color(0XFFFACC70);
  // Red
  Color get redA700 => const Color(0XFFFF0000);
  // Teal
  Color get teal400 => const Color(0XFF299689);

  Color get whiteA700 => const Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
