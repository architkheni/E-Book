import 'package:book/core/app_export.dart';
import 'package:book/presentation/home/home_screen_page.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeRecommendedForYouSeeAllScreen extends StatefulWidget {
  String Title;
  HomeRecommendedForYouSeeAllScreen({Key? key, required this.Title})
      : super(key: key);

  @override
  State<HomeRecommendedForYouSeeAllScreen> createState() =>
      _HomeRecommendedForYouSeeAllScreenState();
}

class _HomeRecommendedForYouSeeAllScreenState
    extends State<HomeRecommendedForYouSeeAllScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
                  onTapArrowleft2(context);
                }),
          ),
          title: Padding(
              padding: getPadding(left: 11),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: AppbarSubtitle(text: "${widget.Title}")),
                Align(
                                      alignment: Alignment.centerLeft,

                  child: Padding(
                      padding: getPadding(top: 3),
                      child: SizedBox(
                          width: 250,
                          child: Divider(
                              height:2,
                              thickness: 2,
                              color: appTheme.teal400))),
                )
              ]))),
      body: Padding(
        padding: const EdgeInsets.only(left: 17, top: 4, right: 20),
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemCount: 15,
            itemBuilder: (context, index) {
              return Container(
                decoration: AppDecoration.fill4.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgE50c016fb6a84106x74,
                        height: _height / 8,
                        width: _width / 5,
                        fit: BoxFit.fill,
                        radius: BorderRadius.circular(5),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 5, top: 1, bottom: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Book Name",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.labelLarge,
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 7),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgLockTeal400,
                                    height: 16,
                                    width: 13,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              // color: Colors.deepPurple,
                              height: _height / 10.5,
                              width: _width / 1.4,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant.imgGgread,
                                          height: 16,
                                          width: 16,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, top: 1, bottom: 1),
                                          child: Text(
                                            "8m",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .bodySmallTeal400,
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
            }),
      ),
    ));
  }

  ///Handling route based on bottom click actions

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft2(BuildContext context) {
    Navigator.pop(context);
  }
}
