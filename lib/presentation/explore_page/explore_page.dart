import '../../core/app_export.dart';
import '../../widgets/custom_text_form_field.dart';
import '../explore_page/widgets/chipviewframefo_item_widget.dart';
import '../explore_page/widgets/explore_item_widget.dart';
import 'package:flutter/material.dart';

import '../home_recommended_for_you_see_all_screen/home_recommended_for_you_see_all_screen.dart'; 

// ignore_for_file: must_be_immutable
class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);

  TextEditingController framefortyfourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray90003,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.black,
                child: SingleChildScrollView(
                    padding: getPadding(top: 24),
                    child: Padding(
                        padding: getPadding(left: 15, bottom: 7),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(left: 1),
                                  child: Text("Explore",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: theme.textTheme.headlineSmall)),
                              Padding(
                                  padding: getPadding(top: 2),
                                  child: SizedBox(
                                      width: 90,
                                      child: Divider(
                                          height: 2,
                                          thickness: 2,
                                          color: appTheme.teal400,
                                          indent: 1))),
                              CustomTextFormField(
                                  controller: framefortyfourController,
                                  margin:
                                      getMargin(left: 1, top: 23, right: 16),
                                  contentPadding: getPadding(
                                      top: 14, right: 30, bottom: 14),
                                  textStyle: CustomTextStyles.bodyMediumwhite500,
                                  hintText: "Title, author or keyword",
                                  hintStyle: CustomTextStyles.bodyMediumwhite500,
                                  prefix: Container(
                                      margin: getMargin(
                                          left: 16,
                                          top: 14,
                                          right: 10,
                                          bottom: 14),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgSearch)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(45)),
                                  filled: true,
                                  autofocus: false,
                                  fillColor: appTheme.blueGray900),
                              Padding(
                                  padding: getPadding(top: 42),
                                  child: Text("Categories",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: theme.textTheme.titleLarge)),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  padding: getPadding(top: 13),
                                  child: IntrinsicWidth(
                                      child: Wrap(
                                          runSpacing: getVerticalSize(5),
                                          spacing: getHorizontalSize(5),
                                          children: List<Widget>.generate(
                                              11,
                                              (index) =>
                                                  ChipviewframefoItemWidget())))),
                              Padding(
                                  padding: getPadding(left: 1, top: 45),
                                  child: Row(children: [
                                    Text("Recent Added",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.headlineSmall),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                         Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeRecommendedForYouSeeAllScreen(Title: "Recent Added",)),
                                        );
                                      },
                                      child: Padding(
                                          padding: getPadding(top: 7, bottom: 7),
                                          child: Text("Show all",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .labelLargeTeal400)),
                                    ),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgArrowright,
                                        height: getSize(16),
                                        width: getSize(16),
                                        margin: getMargin(
                                            left: 4, top: 7, bottom: 7))
                                  ])),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                      height: getVerticalSize(287),
                                      child: ListView.separated(
                                          padding: getPadding(left: 1, top: 31),
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                                width: getHorizontalSize(13));
                                          },
                                          itemCount: 4,
                                          itemBuilder: (context, index) {
                                            return ExploreItemWidget(
                                                onTapStackellipse394: () {
                                              // onTapStackellipse394(context);
                                            });
                                          })))
                            ]))))));
  }

  /// Navigates to the detailPageContainer1Screen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the detailPageContainer1Screen.
  // onTapStackellipse394(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.detailPageContainer1Screen);
  // }
}
