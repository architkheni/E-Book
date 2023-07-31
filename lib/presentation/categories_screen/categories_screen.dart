import 'package:book/core/app_export.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../langugaes_screen/langugaes_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(top: 41, bottom: 41),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(left: 16),
                child: Text(
                  "Select Categories",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.headlineLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: IntrinsicWidth(
                  child: Container(
                    height: height / 2.5,
                    width: width,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: getVerticalSize(300),
                        padding: getPadding(
                            left: 16, top: 22, right: 16, bottom: 22),
                        decoration: AppDecoration.fill.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: getPadding(top: 2),
                              child: Text(
                                "Select the type of book you enjoy reading.",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodyMediumThin,
                              ),
                            ),
                            Spacer(),
                            Center(
                              child: Wrap(
                                runSpacing: getVerticalSize(5),
                                spacing: getHorizontalSize(5),
                                children: List<Widget>.generate(
                                  9,
                                  (index) =>
                                      // ChipviewframefoItemWidget(),
                                      RawChip(
                                    padding: getPadding(right: 16),
                                    showCheckmark: false,
                                    labelPadding: EdgeInsets.zero,
                                    label: Text(
                                      "Personal",
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
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            CustomElevatedButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LangugaesScreen()),
                                );
                              },
                              width: double.maxFinite,
                              height: getVerticalSize(48),
                              text: "Continue",
                              // margin: getMargin(top: 188),
                              buttonStyle: CustomButtonStyles.fillTeal400,
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallPrimary_1,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: getPadding(top: 12),
                                child: Text(
                                  "Select 3 or more genres to continue",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodySmallGray400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
