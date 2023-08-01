import 'package:book/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListoneItemWidget extends StatelessWidget {
  const ListoneItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(
        128,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: getPadding(
            left: 8,
            right: 8,
          ),
          decoration: AppDecoration.fill1.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomImageView(
                svgPath: ImageConstant.img,
                height: getVerticalSize(
                  20,
                ),
                width: getHorizontalSize(
                  25,
                ),
                margin: getMargin(
                  top: 8,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 12,
                  top: 16,
                ),
                child: Text(
                  "",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 30,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgE50c016fb6a8454x37,
                      height: getVerticalSize(
                        54,
                      ),
                      width: getHorizontalSize(
                        37,
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.img,
                      height: getVerticalSize(
                        20,
                      ),
                      width: getHorizontalSize(
                        25,
                      ),
                      margin: getMargin(
                        left: 50,
                        bottom: 34,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
