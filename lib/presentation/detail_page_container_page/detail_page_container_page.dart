import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../core/utils/color_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../book_read_screen/book_read_screen.dart';
import '../detail_page_container_page/widgets/chipviewframefo2_item_widget.dart';
import '../home/widgets/listtitle_item_widget.dart';
import '../home_recommended_for_you_see_all_screen/home_recommended_for_you_see_all_screen.dart';

class DetailPageContainerPage extends StatelessWidget {
  const DetailPageContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray90003,
            body: Container(
                width: _width,
                height: _height,
                decoration: AppDecoration.black,
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              color: Colors.pink,
                              height: _height / 2.8,
                              width: _width,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgE50c016fb6a84,
                                    height: _height / 2.8,
                                    width: _width,
                                    fit: BoxFit.fill,
                                  ),
                                  Align(
                                      child: Container(
                                          width: _width,
                                          decoration: AppDecoration
                                              .gradientnamegray90003opacity0namegray90003,
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: Container(
                                                      height: 35,
                                                      width: 35,
                                                      // color: Colors.red,
                                                      child: Center(
                                                        child: CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .likeIcon,
                                                          height: 20,
                                                          width: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 22),
                                                  child: Container(
                                                    // color: Colors.amber,
                                                    height: _height / 5,
                                                    width: _width / 2.7,
                                                    child: CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgE50c016fb6a84,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16, right: 16),
                                                  child: GestureDetector(
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
                                                          width: _width,
                                                          decoration: AppDecoration.fill.copyWith(
                                                              color: ColorConstant
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder10),
                                                          child: Row(children: [
                                                            Spacer(),
                                                            CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .readBook,
                                                              height: 24,
                                                              width: 24,
                                                            ),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
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
                                                            Spacer(),
                                                          ]))),
                                                )
                                              ])))
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 25, right: 16),
                            child: Container(
                                width: _width,
                                child: Text(
                                  "Project Management for the Unofficial Proect Manager",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.titleLarge,
                                )),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 8),
                                child: Text(
                                    "Kory Kogon, Suzette Blakemore, and James wood",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.titleSmall),
                              )),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 8),
                                  child: Text("A FanklinConvey Title",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.bodyMediumThin))),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 16, top: 16, right: 16),
                            child: Container(
                              height: 43,
                              padding: EdgeInsets.only(
                                  left: 40, top: 7, right: 40, bottom: 7),
                              decoration: AppDecoration.fill.copyWith(
                                  color: ColorConstant.primaryColor,
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Spacer(),
                                          CustomImageView(
                                            imagePath: ImageConstant.clock,
                                            height: 20,
                                            width: 20,
                                          ),
                                          Padding(
                                              padding: getPadding(
                                                  left: 9, top: 1, bottom: 1),
                                              child: Text("18 min ",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.titleSmall)),
                                          Spacer(),
                                        ],
                                      )),
                                  Container(
                                    width: 1,
                                    color: Color.fromARGB(162, 255, 255, 255),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Spacer(),
                                          CustomImageView(
                                            imagePath: ImageConstant.ideas,
                                            height: 20,
                                            width: 20,
                                          ),
                                          Padding(
                                              padding:
                                                  getPadding(left: 9, top: 2),
                                              child: Text("7 key ideas",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.titleSmall)),
                                          Spacer(),
                                        ],
                                      )),
                                ],
                              ), /* Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Spacer(),
                                  CustomImageView(
                                    imagePath: ImageConstant.Clock,
                                    height: 20,
                                    width: 20,
                                  ),
                                  Padding(
                                      padding: getPadding(
                                          left: 9, top: 1, bottom: 1),
                                      child: Text("18 min ",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.titleSmall)),
                                  Spacer(),
                                  // SizedBox(
                                  //     height: getVerticalSize(20),
                                  //     child: VerticalDivider(
                                  //         width: getHorizontalSize(1),
                                  //         thickness: getVerticalSize(1),
                                  //         color: appTheme.gray400
                                  //             .withOpacity(0.46))),
                                  CustomImageView(
                                      imagePath: ImageConstant.Ideas,
                                      height: 20,
                                      width: 20,
                                      ),
                                  Padding(
                                      padding: getPadding(left: 9, top: 2),
                                      child: Text("7 key ideas",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.titleSmall)),
                                          Spacer(),
                                ]) */
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 31),
                                child: Text("About this Book",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        CustomTextStyles.titleMediumWhiteA700),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 7, right: 16),
                            child: Container(
                                width: _width,
                                child: Text(
                                    "Getting Along (2022) describes the importance of workplace interactions and their effecs on productivity and creaiviy.",
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodyMediumThin)),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 16, top: 13),
                                  child: Wrap(
                                      runSpacing: getVerticalSize(5),
                                      spacing: getHorizontalSize(5),
                                      children: List<Widget>.generate(
                                          5,
                                          (index) => Chipviewframefo2ItemWidget(
                                                text: "Demo Text",
                                              ))))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 27),
                                child: Text("7 Chapters",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.titleLarge),
                              )),
                          GestureDetector(
                              onTap: () {
                                // onTapRowone(context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        "01",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles
                                            .titleMediumWhiteA700,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Chapter ",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .titleMediumWhiteA700),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Subscribe to unlock all 2 key ideas from book book book",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .bodyMediumThin,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: CustomIconButton(
                                        height: 32,
                                        width: 32,
                                        child: CustomImageView(
                                          height: 25,
                                          width: 25,
                                          imagePath: ImageConstant.imgUillock1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 20, right: 16),
                            child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: getVerticalSize(24));
                                },
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return /* ListtypeItemWidget(); */
                                      Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          "0${index + 2}",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .titleMediumWhiteA700,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    "Chapter ${index + 1}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles
                                                        .titleMediumWhiteA700),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Subscribe to unlock all 2 key ideas from book book book",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .bodyMediumThin,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      CustomIconButton(
                                        height: 32,
                                        width: 32,
                                        child: CustomImageView(
                                          height: 25,
                                          width: 25,
                                          imagePath: ImageConstant.imgUillock1,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 32, top: 24),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6, bottom: 6, left: 0),
                                        child: Text("Final Summary",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .titleMediumBold)),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: CustomIconButton(
                                          height: 32,
                                          width: 32,
                                          child: CustomImageView(
                                              height: 25,
                                              width: 25,
                                              imagePath:
                                                  ImageConstant.imgUillock1)),
                                    )
                                  ])),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 31),
                                child: Text("About the Author",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        CustomTextStyles.titleMediumWhiteA700),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 7, right: 16),
                            child: Container(
                                width: _width,
                                child: Text(
                                    "Getting Along (2022) describes the importance of workplace interactions and their effecs on productivity and creaiviy.",
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodyMediumThin)),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 25, right: 16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Similar Books",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.headlineSmall),
                                    CustomElevatedButton(
                                        width: 66,
                                        height: 16,
                                        text: "Show all",
                                        margin: getMargin(top: 7, bottom: 7),
                                        rightIcon: Container(
                                            margin: getMargin(left: 4),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowright)),
                                        buttonStyle: CustomButtonStyles.none,
                                        buttonTextStyle:
                                            CustomTextStyles.labelLargeTeal400,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeRecommendedForYouSeeAllScreen(
                                                      title: "Similar Books",
                                                      books: [],
                                                    )),
                                          );
                                        })
                                  ])),
                          Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                  height: _height / 2.9,
                                  child: ListView.separated(
                                      padding: getPadding(left: 16, top: 32),
                                      physics: BouncingScrollPhysics(),
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
