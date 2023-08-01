import 'package:book/core/app_export.dart';
import 'package:book/presentation/home/home_screen_page.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:book/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomeRecommendedForYouSeeAllOneScreen extends StatelessWidget {
  HomeRecommendedForYouSeeAllOneScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor:
                theme.colorScheme.onPrimaryContainer.withOpacity(1),
            appBar: CustomAppBar(
                height: getVerticalSize(70),
                leadingWidth: 27,
                leading: AppbarImage(
                    height: getVerticalSize(20),
                    width: getHorizontalSize(11),
                    svgPath: ImageConstant.imgArrowleftBlueGray50,
                    margin: getMargin(left: 16, top: 15, bottom: 20),
                    onTap: () {
                      onTapArrowleft3(context);
                    }),
                title: Padding(
                    padding: getPadding(left: 11),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppbarSubtitle(text: "Recently Added"),
                          SizedBox(
                              width: getHorizontalSize(172),
                              child: Divider(
                                  height: getVerticalSize(2),
                                  thickness: getVerticalSize(2),
                                  color: appTheme.teal400))
                        ]))),
            body: Padding(
                padding: getPadding(left: 17, top: 8, right: 20),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(12));
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return 
                      // Liste50c016fb6a1ItemWidget();

                      Container(
      padding: getPadding(
        left: 8,
        top: 7,
        right: 8,
        bottom: 7,
      ),
      decoration: AppDecoration.fill4.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
          ),
          Expanded(
            child: Padding(
              padding: getPadding(
                left: 10,
                top: 1,
                bottom: 4,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 2,
                        ),
                        child: Text(
                          "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgLockTeal400,
                        height: getVerticalSize(
                          16,
                        ),
                        width: getHorizontalSize(
                          13,
                        ),
                        margin: getMargin(
                          bottom: 2,
                        ),
                      ),
                    ],
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
                                  "8m",
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
                            style: CustomTextStyles.bodySmallThin_1,
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
    );
 
                    })),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type));
            })));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenPage;
      case BottomBarEnum.Search:
        return "/";
      case BottomBarEnum.Library:
        return "/";
      case BottomBarEnum.Profile:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenPage:
        return HomeScreenPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft3(BuildContext context) {
    Navigator.pop(context);
  }
}
