import 'package:book/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Listtitle3ItemWidget extends StatelessWidget {
  const Listtitle3ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(
        192,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: getVerticalSize(
            256,
          ),
          width: getHorizontalSize(
            192,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: getPadding(
                    bottom: 19,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "The Good Guy",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        "A Fanklin",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        "Banish Forgutable Forever",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodySmall,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 2,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: getPadding(
                                left: 7,
                                top: 1,
                                right: 7,
                                bottom: 1,
                              ),
                              decoration: AppDecoration.fill3.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder5,
                              ),
                              child: Text(
                                "Blinks",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 4,
                                top: 1,
                                bottom: 1,
                              ),
                              child: Text(
                                "21 min",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: getVerticalSize(
                    256,
                  ),
                  width: getHorizontalSize(
                    192,
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: getSize(
                            192,
                          ),
                          width: getSize(
                            192,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                96,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: getVerticalSize(
                            145,
                          ),
                          width: getHorizontalSize(
                            101,
                          ),
                          margin: getMargin(
                            left: 41,
                          ),
                          decoration: AppDecoration.outline,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgE50c016fb6a8454x37,
                                height: getVerticalSize(
                                  145,
                                ),
                                width: getHorizontalSize(
                                  101,
                                ),
                                alignment: Alignment.center,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: getVerticalSize(
                                    145,
                                  ),
                                  width: getHorizontalSize(
                                    100,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CustomImageView(
                                        svgPath: ImageConstant.imgBookmark,
                                        height: getVerticalSize(
                                          11,
                                        ),
                                        width: getHorizontalSize(
                                          8,
                                        ),
                                        alignment: Alignment.topRight,
                                        margin: getMargin(
                                          top: 3,
                                          right: 3,
                                        ),
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant
                                            .imgE50c016fb6a84145x100,
                                        height: getVerticalSize(
                                          145,
                                        ),
                                        width: getHorizontalSize(
                                          100,
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
