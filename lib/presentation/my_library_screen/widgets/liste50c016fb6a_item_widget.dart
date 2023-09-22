import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Liste50c016fb6aItemWidget extends StatelessWidget {
  const Liste50c016fb6aItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(
          left: 8,
          top: 7,
          right: 8,
          bottom: 7,
        ),
        decoration: AppDecoration.fill4.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
          color: isLight ? ColorConstant.kF3F3F3 : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getVerticalSize(
                106,
              ),
              width: getHorizontalSize(
                74,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgE50c016fb6a84106x74,
                    height: getVerticalSize(
                      106,
                    ),
                    width: getHorizontalSize(
                      74,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        5,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgE50c016fb6a842,
                    height: getVerticalSize(
                      106,
                    ),
                    width: getHorizontalSize(
                      74,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        5,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: getPadding(
                  left: 10,
                  top: 3,
                  bottom: 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: getVerticalSize(
                        81,
                      ),
                      width: getHorizontalSize(
                        249,
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgGgread,
                                  height: getSize(
                                    16,
                                  ),
                                  width: getSize(
                                    16,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 1,
                                    bottom: 1,
                                  ),
                                  child: Text(
                                    '8m',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallTeal400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has",
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodySmallThin_1.copyWith(
                                color: isLight ? ColorConstant.black : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
