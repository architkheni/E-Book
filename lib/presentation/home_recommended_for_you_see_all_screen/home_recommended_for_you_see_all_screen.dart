import 'package:book/core/app_export.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeRecommendedForYouSeeAllScreen extends StatefulWidget {
  final String title;
  HomeRecommendedForYouSeeAllScreen({Key? key, required this.title})
      : super(key: key);

  @override
  State<HomeRecommendedForYouSeeAllScreen> createState() =>
      _HomeRecommendedForYouSeeAllScreenState();
}

class _HomeRecommendedForYouSeeAllScreenState
    extends State<HomeRecommendedForYouSeeAllScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  String selectedValue = 'A to Z';

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
            padding: getPadding(left: 15),
            child: widget.title == 'Favourite'
                ? CustomImageView(
                    imagePath: ImageConstant.favouritesImage,
                    height: 35,
                  )
                : widget.title == 'In Progress'
                    ? CustomImageView(
                        imagePath: ImageConstant.inProgressImage,
                        height: 35,
                      )
                    : widget.title == 'Finished'
                        ? CustomImageView(
                            imagePath: ImageConstant.finishedImage,
                            height: 35,
                          )
                        : widget.title == 'My History'
                            ? CustomImageView(
                                imagePath: ImageConstant.myHistoryImage,
                                height: 35,
                              )
                            : widget.title == 'Recently Added'
                                ? CustomImageView(
                                    imagePath: ImageConstant.recentlyAddedImage,
                                    height: 35,
                                  )
                                : widget.title == 'Recommended For You'
                                    ? CustomImageView(
                                        imagePath: ImageConstant.frame136Image,
                                        height: 35,
                                      )
                                    : widget.title == 'Similar Books'
                                        ? CustomImageView(
                                            imagePath:
                                                ImageConstant.similarBooksImage,
                                            height: 35,
                                          )
                                        : widget.title == 'Top Search'
                                            ? CustomImageView(
                                                imagePath: ImageConstant
                                                    .topSearchImage,
                                                height: 35,
                                              )
                                            : widget.title == 'Categories'
                                                ? CustomImageView(
                                                    imagePath: ImageConstant
                                                        .categoriesImage,
                                                    height: 35,
                                                  )
                                                : widget.title == 'Popular'
                                                    ? CustomImageView(
                                                        imagePath: ImageConstant
                                                            .popularImage,
                                                        height: 35,
                                                      )
                                                    : SizedBox.shrink(),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 17, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "15 Items",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.titleSmallWhiteA700,
                ),
                Spacer(),
                Text(
                  "Sort By  ",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.bodyMediumGray400,
                ),
                DropdownButton<String>(
                  // padding: EdgeInsets.zero,
                  isDense: true,
                  underline: SizedBox.shrink(),
                  style: CustomTextStyles.titleSmallWhiteA700,
                  icon: Icon(Icons.keyboard_arrow_down_outlined,
                      color: appTheme.whiteA700),
                  value: selectedValue,
                  dropdownColor:
                      theme.colorScheme.onPrimaryContainer.withOpacity(1),
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: <String>['A to Z', 'Z to A']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
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
                              padding: const EdgeInsets.only(
                                  left: 5, top: 1, bottom: 4),
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
                                      widget.title == 'In Progress'
                                          ? SizedBox()
                                          : widget.title == 'Finished'
                                              ? SizedBox()
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10, bottom: 7),
                                                  child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgLockTeal400,
                                                    height: 16,
                                                    width: 13,
                                                  ),
                                                ),
                                    ],
                                  ),
                                  Container(
                                    // color: Colors.deepPurple,
                                    height: _height / 9,
                                    width: _width / 1.4,
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Column(
                                            children: [
                                              Spacer(),
                                              Row(
                                                children: [
                                                  CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgGgread,
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 4,
                                                            top: 1,
                                                            bottom: 1),
                                                    child: Text(
                                                      "8m",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: CustomTextStyles
                                                          .bodySmallTeal400,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  widget.title == 'Finished'
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 10),
                                                          child: Container(
                                                            height: 20,
                                                            width: 70,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: appTheme
                                                                  .teal400,
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "Finished",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: theme
                                                                    .textTheme
                                                                    .labelLarge,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox()
                                                ],
                                              ),
                                              widget.title == 'In Progress'
                                                  ? Row(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height: 3,
                                                            width: _width / 3,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              // color: appTheme
                                                              //     .teal400,
                                                            ),
                                                            child:
                                                                LinearProgressIndicator(
                                                              color: appTheme
                                                                  .teal400,
                                                              backgroundColor:
                                                                  appTheme
                                                                      .whiteA700,
                                                              value: 0.4,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text(
                                                          "10/20",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: CustomTextStyles
                                                              .bodySmallThin_1,
                                                        )
                                                      ],
                                                    )
                                                  : SizedBox(),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has",
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .bodySmallThin_1,
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
          ],
        ),
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
