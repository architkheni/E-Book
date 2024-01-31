import 'package:book/core/utils/color_constant.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class Chipviewframefo2ItemWidget extends StatelessWidget {
  final String text;
  final String? icon;

  final Function()? onTap;
  const Chipviewframefo2ItemWidget({Key? key, required this.text, this.onTap, this.icon})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return RawChip(
      onPressed: onTap,
      padding: getPadding(left: 5, right: 10),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: isLight ? ColorConstant.black : appTheme.blueGray50,
          fontSize: getFontSize(12),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w100,
        ),
      ),
      selected: false,
      backgroundColor: isLight ? ColorConstant.kF3F3F3 : appTheme.blueGray900,
      selectedColor: appTheme.blueGray900,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(8),
        ),
      ),
      avatar: CustomImageView(
        svgPath: icon == null  ? ImageConstant.imgGroup1171274896 : null,
        url: icon,
        height: 12,
        width: 12,
        margin: getMargin(right: 3),
        color: icon != null ? null : isLight ? Colors.black : null,
      ),
    );
  }
}
