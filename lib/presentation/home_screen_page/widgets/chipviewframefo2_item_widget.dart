import 'package:book/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Chipviewframefo2ItemWidget extends StatelessWidget {
  const Chipviewframefo2ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: getPadding(right: 16),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Personal growth",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: appTheme.blueGray50,
          fontSize: getFontSize(12),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w100,
        ),
      ),
      avatar: CustomImageView(
        svgPath: ImageConstant.imgGroup1171274896,
        height: getSize(12),
        width: getSize(12),
        margin: getMargin(right: 10),
      ),
      selected: false,
      backgroundColor: theme.colorScheme.primary,
      selectedColor: appTheme.teal400,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(8),
        ),
      ),
      onSelected: (value) {},
    );
  }
}
