import 'package:book/core/utils/color_constant.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class Chipviewframefo2ItemWidget extends StatelessWidget {
  final String text;
  const Chipviewframefo2ItemWidget({Key? key, required this.text})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return RawChip(
      padding: getPadding(left: 16, right: 16),
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
      onSelected: (value) {},
    );
  }
}
