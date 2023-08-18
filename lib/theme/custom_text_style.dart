import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumThin_1 => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w300,
      );
       static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
        static get titleMediumWhiteA500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w300,
      );
        static get titleMediumWhiteA400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.teal400,
        fontWeight: FontWeight.w400,
      );
       static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
        static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: getFontSize(
          12,
        ),
        fontWeight: FontWeight.w100,
      );
       static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray400,
        fontSize: getFontSize(
          12,
        ),
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumThin => theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get bodySmallThin => theme.textTheme.bodySmall!.copyWith(
        fontSize: getFontSize(
          12,
        ),
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumGray400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray400,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w400,
      );
      static get bodyMediumGray200 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray400,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallTeal400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.teal400,
        fontWeight: FontWeight.w400,
      );
  static get bodySmallThin_1 => theme.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w300,
      );
  // Title text style
  static get titleSmallTeal400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.teal400,
      );
  static get titleSmallPrimary_1 => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleSmallTeal400_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.teal400,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray400,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  // Label text style
  static get labelLargeTeal400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.teal400,
      );
  static get labelLargeTeal400Bold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.teal400,
        fontWeight: FontWeight.w700,
      );
      static get labelLargeTeal500Bold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.teal400,
        fontWeight: FontWeight.w500,fontSize: getFontSize(
          13,
        ),
      );
      static get titleSmallGray500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray400,
        fontWeight: FontWeight.w300,
        fontSize: getFontSize(
          13,
        ),
      );
      static get ProfileTitle => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
        fontSize: getFontSize(
          22,
        ),
      );
        static get titleSmallWhiteA400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w400,
      );
}

extension on TextStyle {
  TextStyle get outfit {
    return copyWith(
      fontFamily: 'Outfit',
    );
  }
}
