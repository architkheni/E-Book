import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_library_screen/widgets/liste50c016fb6a_item_widget.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  int? selected;
  List<Map<String, dynamic>> libraryData = [
    {
      'image': ImageConstant.saveAllBook,
      'title': 'Favourite',
      'icon': ImageConstant.imgArrowright,
    },
    {
      'image': ImageConstant.inReed,
      'title': 'In Progress',
      'icon': ImageConstant.imgArrowright,
    },
    {
      'image': ImageConstant.checked,
      'title': 'Finished',
      'icon': ImageConstant.imgArrowright,
    },
  ];
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: getPadding(top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(left: 13),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: appTheme.teal400,
                            width: 2,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(bottom: 3),
                      child: AppbarSubtitle(
                        text: 'My Libarary',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(top: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemCount: libraryData.length,
                    itemBuilder: (context, index) {
                      return Consumer<WishlistProvider>(
                        builder: (context, provider, child) {
                          return ListTile(
                            onTap: () {
                              setState(() {
                                // if (index == 0)
                                // TODO: comment becase flag is not come
                                // // Navigator.push(
                                // //   context,
                                // //   MaterialPageRoute(
                                // //       builder: (context) =>
                                // //           HomeRecommendedForYouSeeAllScreen(
                                // //             title: "Favourite",
                                // //             books: provider.wishlist,
                                // //           )),
                                // // );
                                // if (index == 1) {
                                //   TODO: comment becase flag is not come
                                //   // Navigator.push(
                                //   //   context,
                                //   //   MaterialPageRoute(
                                //   //       builder: (context) =>
                                //   //           HomeRecommendedForYouSeeAllScreen(
                                //   //             title: "In Progress",
                                //   //             books: [],
                                //   //           )),
                                //   // );
                                //   if (index == 2) {
                                //     // TODO: comment becase flag is not come
                                //     // Navigator.push(
                                //     //   context,
                                //     //   MaterialPageRoute(
                                //     //       builder: (context) =>
                                //     //           HomeRecommendedForYouSeeAllScreen(
                                //     //             title: "Finished",
                                //     //             books: [],
                                //     //           )),
                                //     // );
                                //     selected = index;
                                //   }
                                // }
                                // onTapRowfavorite(context);
                              });
                            },
                            dense: true,
                            focusColor: Colors.transparent,
                            leading: Container(
                              height: 40,
                              width: 55,
                              decoration: BoxDecoration(
                                color: selected == index
                                    ? appTheme.teal400
                                    : Colors.transparent,
                                border: Border.all(
                                  color: selected != index && isLight
                                      ? ColorConstant.black
                                      : ColorConstant.whiteA700,
                                  width: 1,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6)),
                              ),
                              child: CustomImageView(
                                imagePath: libraryData[index]['image'],
                                height: 20,
                                alignment: Alignment.center,
                                color: selected != index && isLight
                                    ? ColorConstant.black
                                    : null,
                              ),
                            ),
                            title: Text(
                              libraryData[index]['title'],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  CustomTextStyles.titleSmallWhiteA700.copyWith(
                                color: isLight ? ColorConstant.black : null,
                              ),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: CustomImageView(
                                color: isLight ? ColorConstant.black : null,
                                svgPath: ImageConstant.imgArrowright,
                                height: getSize(16),
                                width: getSize(16),
                                margin: getMargin(left: 4, top: 2, bottom: 7),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                /*    GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeRecommendedForYouSeeAllScreen(
                                            Title: "Favourite",
                                          )),
                                );
                                // onTapRowfavorite(context);
                              },
                              child: Padding(
                                  padding: getPadding(left: 16, top: 21),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 36,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: CustomImageView(
                                                imagePath:
                                                    ImageConstant.SaveAllBook,
                                                alignment: Alignment.center),
                                          ),
                                        ),
                                        Padding(
                                            padding: getPadding(
                                                left: 15, top: 10, bottom: 8),
                                            child: Text("Favourite",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .titleSmallWhiteA700)),
                                        Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowright,
                                              height: getSize(16),
                                              width: getSize(16),
                                              margin: getMargin(
                                                  left: 4, top: 2, bottom: 7)),
                                        ),
                                      ]))),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeRecommendedForYouSeeAllScreen(
                                            Title: "In Progress",
                                          )),
                                );
                              },
                              child: Padding(
                                  padding: getPadding(left: 16, top: 9),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 36,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            // color: Colors.red,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: CustomImageView(
                                                imagePath: ImageConstant.inReed,
                                                alignment: Alignment.center),
                                          ),
                                        ),
                                        Padding(
                                            padding: getPadding(
                                                left: 14, top: 11, bottom: 8),
                                            child: Text("In Progress",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .titleSmallMedium)),
                                        Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowright,
                                              height: getSize(16),
                                              width: getSize(16),
                                              margin: getMargin(
                                                  left: 4, top: 2, bottom: 7)),
                                        )
                                      ]))),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeRecommendedForYouSeeAllScreen(
                                          Title: "Finished",
                                        )),
                              );
                            },
                            child: Padding(
                                padding: getPadding(left: 16, top: 9),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 36,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.BookFinish,
                                              alignment: Alignment.center),
                                        ),
                                      ),
                                      Padding(
                                          padding: getPadding(
                                              left: 14, top: 10, bottom: 9),
                                          child: Text("Finished",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .titleSmallMedium)),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgArrowright,
                                            height: getSize(16),
                                            width: getSize(16),
                                            margin: getMargin(
                                                left: 4, top: 2, bottom: 7)),
                                      )
                                    ])),
                          ),*/
                Padding(
                  padding: getPadding(left: 16, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My History',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: isLight ? ColorConstant.black : null,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // TODO: comment becase flag is not come
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           HomeRecommendedForYouSeeAllScreen(
                          //             title: "My History",
                          //             books: [],
                          //           )),
                          // );
                        },
                        child: Padding(
                          padding: getPadding(top: 2, bottom: 7),
                          child: Text(
                            'Show all',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.labelLargeTeal400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          color: ColorConstant.primaryColor,
                          height: getSize(16),
                          width: getSize(16),
                          margin: getMargin(left: 4, top: 2, bottom: 7),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: getVerticalSize(648),
                    width: double.maxFinite,
                    margin: getMargin(top: 9),
                    child: Stack(
                      // alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: getPadding(left: 17, right: 20),
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: getVerticalSize(12));
                            },
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return const Liste50c016fb6aItemWidget();
                            },
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
      ),
    );
  }
}
