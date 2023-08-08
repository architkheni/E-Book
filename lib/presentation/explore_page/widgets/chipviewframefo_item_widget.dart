import 'package:flutter/material.dart';
 
import '../../../core/app_export.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/custom_image_view.dart';

// ignore: must_be_immutable
class ChipviewframefoItemWidget extends StatelessWidget {
  const ChipviewframefoItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: getPadding(
        right: 16,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Personal growth",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: appTheme.blueGray50,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w100,
        ),
      ),
      avatar: CustomImageView(
        svgPath: ImageConstant.imgGroup1171274896,
        height: getSize(
          12,
        ),
        width: getSize(
          12,
        ),
        margin: getMargin(
          right: 10,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.blueGray900,
      selectedColor: appTheme.blueGray900,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            8,
          ),
        ),
      ),
      onSelected: (value) {},
    );
  }
}
