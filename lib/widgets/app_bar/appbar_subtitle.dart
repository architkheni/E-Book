import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarSubtitle extends StatelessWidget {
  AppbarSubtitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
    this.style,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: style ??
              theme.textTheme.headlineSmall!.copyWith(
                color: isLight
                    ? ColorConstant.black
                    : theme.colorScheme.onPrimary.withOpacity(1),
              ),
        ),
      ),
    );
  }
}
