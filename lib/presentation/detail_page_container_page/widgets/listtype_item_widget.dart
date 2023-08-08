import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/custom_text_style.dart';
import '../../../widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ListtypeItemWidget extends StatelessWidget {
  const ListtypeItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: getPadding(
            bottom: 25,
          ),
          child: Text(
            "a",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: CustomTextStyles.titleMediumWhiteA700,
          ),
        ),
        Expanded(
          child: Padding(
            padding: getPadding(
              left: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "B",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.titleMediumWhiteA700,
                ),
                Padding(
                  padding: getPadding(
                    top: 2,
                  ),
                  child: Text(
                    "Subscribe to unlock all 2 key ideas from book ",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.bodyMediumThin,
                  ),
                ),
              ],
            ),
          ),
        ),
        CustomIconButton(
          height: 32,
          width: 32,
          margin: getMargin(
            left: 14,
            top: 6,
            bottom: 6,
          ),
          padding: getPadding(
            all: 6,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgUillock1,
          ),
        ),
      ],
    );
  }
}
