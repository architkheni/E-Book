import 'package:book/core/app_export.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import '../custom_bottom_bar/custom_bottom_bar.dart';
import '../home/home_screen_page.dart';

class LangugaesScreen extends StatelessWidget {
  const LangugaesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        
        appBar: CustomAppBar(
            height: 60,
            leadingWidth: 35,
            leading: Container(
              // color: Colors.red,
              child: AppbarImage(
                  height: 20,
                  width: 15,
                  svgPath: ImageConstant.imgArrowleftBlueGray50,
                  margin: getMargin(left: 16, top: 17, bottom: 18),
                  onTap: () {
                  Navigator.pop(context);
                  }),
            ),
            title: Padding(
                padding: getPadding(left: 11),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppbarSubtitle(text: "App Languages"),
                    ])), actions: [
            AppbarSubtitle1(
              text: "Skip",
              margin: getMargin( top: 20,),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16,top: 10,left: 10),
              child: AppbarImage(
                height: getVerticalSize(14),
                width: getHorizontalSize(8),
                svgPath: ImageConstant.imgArrowright,
                // margin: getMargin(left: 10, top: 16, right: 16, bottom: 5),
              ),
            ),
          ],),
        body: Container(
          width: getHorizontalSize(358),
          margin: getMargin(left: 16, top: 3, right: 16, bottom: 5),
          padding: getPadding(left: 16, top: 24, right: 16, bottom: 24),
          decoration: AppDecoration.fill.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: getPadding(top: 1),
                child: Text(
                  "Select languages you enjoy reading",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.bodyMediumThin,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(left: 21, top: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: getHorizontalSize(97),
                        padding:
                            getPadding(left: 12, top: 9, right: 12, bottom: 9),
                        decoration: AppDecoration.fill3.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "English",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleSmallPrimary,
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgCheckmarkPrimary,
                              height: getSize(24),
                              width: getSize(24),
                              margin: getMargin(left: 4),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(95),
                        margin: getMargin(left: 6),
                        padding:
                            getPadding(left: 12, top: 9, right: 12, bottom: 9),
                        decoration: AppDecoration.outline1.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Malay",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleSmallGray400,
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgUilpluscircle,
                              height: getSize(24),
                              width: getSize(24),
                              margin: getMargin(left: 4),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(85),
                        margin: getMargin(left: 6),
                        padding:
                            getPadding(left: 12, top: 9, right: 12, bottom: 9),
                        decoration: AppDecoration.outline1.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Urdu",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleSmallGray400,
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgUilpluscircle,
                              height: getSize(24),
                              width: getSize(24),
                              margin: getMargin(left: 4),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: CustomElevatedButton(
                  onTap: () {
                    
                    
                     Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  BottombarPage(buttomIndex: 0)),
                                );
                  },
                  width: double.maxFinite,
                  height: getVerticalSize(48),
                  text: "Continue",
                  // margin: getMargin(top: 74),
                  buttonStyle: CustomButtonStyles.fillTeal400,
                  buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
