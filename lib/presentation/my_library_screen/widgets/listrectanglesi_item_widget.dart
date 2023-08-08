import 'package:flutter/material.dart';
import 'package:book/core/app_export.dart';

// ignore: must_be_immutable
class ListrectanglesiItemWidget extends StatelessWidget {
  const ListrectanglesiItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fill2,
      width: getHorizontalSize(
        97,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: getHorizontalSize(
              97,
            ),
            child: Divider(
              height: getVerticalSize(
                1,
              ),
              thickness: getVerticalSize(
                1,
              ),
              color: appTheme.blueGray900,
            ),
          ),
          CustomImageView(
            svgPath: ImageConstant.imgAkariconshomealt1WhiteA700,
            height: getSize(
              24,
            ),
            width: getSize(
              24,
            ),
            margin: getMargin(
              top: 10,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 10,
              bottom: 8,
            ),
            child: Text(
              "",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: CustomTextStyles.bodySmallWhiteA700,
            ),
          ),
        ],
      ),
    );
  }
}
