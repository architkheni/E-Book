import 'package:book/presentation/detail_page_container_page/widgets/listtype_item_widget.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../book_read_screen/book_read_screen.dart';
import '../detail_page_container_page/widgets/chipviewframefo2_item_widget.dart';
import 'package:flutter/material.dart';

import '../home_recommended_for_you_see_all_screen/home_recommended_for_you_see_all_screen.dart';
import '../home_screen_page/widgets/listtitle_item_widget.dart';

class DetailPageContainerPage extends StatelessWidget {
  const DetailPageContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray90003,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.black,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      SizedBox(
                          height: getVerticalSize(299),
                          width: double.maxFinite,
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgE50c016fb6a84,
                                height: getVerticalSize(273),
                                width: getHorizontalSize(390),
                                alignment: Alignment.topCenter),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    decoration: AppDecoration
                                        .gradientnamegray90003opacity0namegray90003,
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: getVerticalSize(16),
                                              width: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  color: appTheme.black900
                                                      .withOpacity(0.9))),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgFavorite,
                                              height: getVerticalSize(12),
                                              width: getHorizontalSize(15),
                                              alignment: Alignment.centerRight,
                                              margin:
                                                  getMargin(top: 8, right: 18)),
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgE50c016fb6a84,
                                              height: getVerticalSize(150),
                                              width: getHorizontalSize(104),
                                              margin: getMargin(top: 44)),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookReadScreen()),
                                                );
                                              },
                                              child: Container(
                                                  height: 60,
                                                  width: Width,
                                                  padding: getPadding(
                                                      top: 16, bottom: 16),
                                                  decoration: AppDecoration.fill
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder10),
                                                  child: Center(
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgUilbook,
                                                              height:
                                                                  getSize(24),
                                                              width:
                                                                  getSize(24)),
                                                          Text("Read Book",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall),
                                                        ]),
                                                  )))
                                        ])))
                          ])),
                      Container(
                          width: getHorizontalSize(353),
                          margin: getMargin(left: 16, top: 24, right: 21),
                          child: Text(
                              "Project Management for the Unofficial Proect Manager",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleLarge)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 8),
                              child: Text(
                                  "Kory Kogon, Suzette Blakemore, and James wood",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.titleSmall))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 8),
                              child: Text("A FanklinConvey Title",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodyMediumThin))),
                      Container(
                          margin: getMargin(left: 16, top: 16, right: 16),
                          padding: getPadding(
                              left: 40, top: 7, right: 40, bottom: 7),
                          decoration: AppDecoration.fill.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgClock,
                                    height: getSize(20),
                                    width: getSize(20),
                                    margin: getMargin(left: 15)),
                                Padding(
                                    padding:
                                        getPadding(left: 9, top: 1, bottom: 1),
                                    child: Text("18 min ",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.titleSmall)),
                                Spacer(),
                                SizedBox(
                                    height: getVerticalSize(20),
                                    child: VerticalDivider(
                                        width: getHorizontalSize(1),
                                        thickness: getVerticalSize(1),
                                        color: appTheme.gray400
                                            .withOpacity(0.46))),
                                CustomImageView(
                                    svgPath: ImageConstant.imgUillightbulbalt,
                                    height: getSize(20),
                                    width: getSize(20),
                                    margin: getMargin(left: 39)),
                                Padding(
                                    padding: getPadding(left: 9, top: 2),
                                    child: Text("7 key ideas",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.titleSmall))
                              ])),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 31),
                              child: Text("About this Book",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStyles.titleMediumWhiteA700))),
                      Container(
                          width: getHorizontalSize(358),
                          margin: getMargin(left: 16, top: 7, right: 16),
                          child: Text(
                              "Getting Along (2022) describes the importance of workplace interactions and their effecs on productivity and creaiviy.",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodyMediumThin)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 13),
                              child: Wrap(
                                  runSpacing: getVerticalSize(5),
                                  spacing: getHorizontalSize(5),
                                  children: List<Widget>.generate(
                                      4,
                                      (index) =>
                                          Chipviewframefo2ItemWidget())))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 27),
                              child: Text("7 Chapters",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.titleLarge))),
                      GestureDetector(
                          onTap: () {
                            // onTapRowone(context);
                          },
                          child: Padding(
                              padding: getPadding(left: 16, top: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(bottom: 17),
                                        child: Text("01",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodyLarge)),
                                    Padding(
                                        padding:
                                            getPadding(left: 16, bottom: 17),
                                        child: Text("Introducion",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .titleMediumWhiteA700)),
                                    Spacer(),
                                    CustomIconButton(
                                        height: 32,
                                        width: 32,
                                        margin: getMargin(top: 6),
                                        padding: getPadding(all: 6),
                                        decoration:
                                            IconButtonStyleHelper.fillGray50,
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgSignal))
                                  ]))),
                      Padding(
                          padding: getPadding(left: 16, top: 30, right: 16),
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(24));
                              },
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return ListtypeItemWidget();
                              })),
                      Padding(
                          padding: getPadding(left: 32, top: 24),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: getPadding(top: 6, bottom: 6),
                                    child: Text("Final Summary",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.titleMediumBold)),
                                CustomIconButton(
                                    height: 32,
                                    width: 32,
                                    margin: getMargin(left: 34),
                                    padding: getPadding(all: 6),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgUillock))
                              ])),
                      Padding(
                          padding: getPadding(left: 16, top: 134, right: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Similar Books",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.headlineSmall),
                                CustomElevatedButton(
                                    width: getHorizontalSize(66),
                                    height: getVerticalSize(16),
                                    text: "Show all",
                                    margin: getMargin(top: 7, bottom: 7),
                                    rightIcon: Container(
                                        margin: getMargin(left: 4),
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgArrowright)),
                                    buttonStyle: CustomButtonStyles.none,
                                    buttonTextStyle:
                                        CustomTextStyles.labelLargeTeal400,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeRecommendedForYouSeeAllScreen()),
                                      );
                                    })
                              ])),
                      Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                              height: getVerticalSize(288),
                              child: ListView.separated(
                                  padding: getPadding(left: 16, top: 32),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        width: getHorizontalSize(13));
                                  },
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return ListtitleItemWidget();
                                  })))
                    ])))));
  }
}
