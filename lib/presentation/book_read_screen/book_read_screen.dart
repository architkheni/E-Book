import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../detail_page_container_page/detail_page_container_page.dart'; 

// ignore_for_file: must_be_immutable
class BookReadScreen extends StatelessWidget {
  BookReadScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray90003,
            appBar: CustomAppBar(
                height: getVerticalSize(71),
                leadingWidth: 37,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgIcroundchevronleft,
                    margin: getMargin(left: 13, top: 16, bottom: 16)),
                actions: [
                  AppbarImage(
                      height: getVerticalSize(17),
                      width: getHorizontalSize(21),
                      svgPath: ImageConstant.imgUpload,
                      margin:
                          getMargin(left: 16, top: 19, right: 16, bottom: 4),
                      onTap: () {
                       
                      }),
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgFrame117,
                      margin: getMargin(left: 9, top: 16, right: 32),
                      onTap: () { 

                      })
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 15, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: getHorizontalSize(347),
                          margin: getMargin(top: 7, right: 12),
                          child: Text(
                              "What is in it for me? Learn how to become an effecive unofficial project manager",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.headlineSmall)),
                      Container(
                          width: getHorizontalSize(356),
                          margin: getMargin(top: 11),
                          child: Text(
                              "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.",
                              maxLines: 9,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleMedium)),
                      Container(
                          width: getHorizontalSize(358),
                          margin: getMargin(top: 15),
                          child: Text(
                              "The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen.",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleMedium)),
                      Container(
                          width: getHorizontalSize(352),
                          margin: getMargin(top: 18, right: 7),
                          child: Text(
                              "Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleMedium)),
                      Container(
                          width: getHorizontalSize(358),
                          margin: getMargin(top: 15),
                          child: Text(
                              "Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleMedium)),
                      Spacer(),
                      Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              width: getHorizontalSize(142),
                              child: Divider(
                                  height: getVerticalSize(4),
                                  thickness: getVerticalSize(4),
                                  color: appTheme.gray400)))
                    ])),
             ));
  }

  
}
