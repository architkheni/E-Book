import 'package:book/core/app_export.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration get fill => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
      );
  static BoxDecoration get fill5 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static BoxDecoration get outline1 => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get gradientnamegray90003opacity0namegray90003 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(
            0.5,
            0,
          ),
          end: const Alignment(
            0.5,
            1,
          ),
          colors: [
            appTheme.gray90003.withOpacity(0),
            appTheme.gray90003.withOpacity(0.6),
            appTheme.gray90003,
          ],
        ),
      );
  static BoxDecoration get fill4 => BoxDecoration(
        color: appTheme.gray900,
      );
  static BoxDecoration get fill1 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.22),
      );
  static BoxDecoration get fill3 => BoxDecoration(
        color: appTheme.teal400,
      );
  static BoxDecoration get outline => const BoxDecoration();
  static BoxDecoration get black => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static BoxDecoration get fill2 => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration
      get gradientnamegray90001nameonPrimaryContaineropacity1 => BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(
                0.5,
                0,
              ),
              end: const Alignment(
                0.5,
                0.55,
              ),
              colors: [
                appTheme.gray90001,
                theme.colorScheme.onPrimaryContainer.withOpacity(1),
              ],
            ),
          );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );
  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10,
    ),
  );

  static BorderRadius roundedBorder5 = BorderRadius.circular(
    getHorizontalSize(
      5,
    ),
  );

  static BorderRadius roundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

// double get strokeAlignInside => BorderSide.strokeAlignInside;

// double get strokeAlignCenter => BorderSide.strokeAlignCenter;

// double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
