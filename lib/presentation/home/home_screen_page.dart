import 'package:book/core/app_export.dart';
import 'package:book/model/book_model.dart';
import 'package:book/presentation/home/widgets/listone_item_widget.dart';
import 'package:book/presentation/home/widgets/listtitle1_item_widget.dart';
import 'package:book/presentation/home/widgets/listtitle3_item_widget.dart';
import 'package:book/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../detail_page_container_page/detail_page_container_page.dart';
import '../detail_page_container_page/widgets/chipviewframefo2_item_widget.dart';
import '../home_recommended_for_you_see_all_screen/home_recommended_for_you_see_all_screen.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        body: Consumer<HomePovider>(builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: appTheme.teal400),
            );
          }
          return Container(
            width: _width,
            // double.maxFinite,
            decoration: AppDecoration.black,
            child: RefreshIndicator(
              color: appTheme.teal400,
              onRefresh: () async {
                context.read<HomePovider>().getDashboardDetails();
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(top: 18, left: 18),
                      child: CustomImageView(
                        imagePath: ImageConstant.forMeImage,
                        height: 35,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 16, right: 16),
                      child: Container(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(left: 6),
                                  child: Text(
                                    "Free Blinks of the Day",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(left: 6, top: 10),
                                  child: Text(
                                    "Selected by our creators",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodyMediumThin,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: _height / 4.5,
                                    width: _width,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailPageContainerPage()),
                                            );
                                          },
                                          child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgE50c016fb6a84,
                                            height: _height / 4.5,
                                            width: _width,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: _height / 4.5,
                                            width: _width,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment(0.5, 0),
                                                end: Alignment(0.5, 1),
                                                colors: [
                                                  theme.colorScheme
                                                      .onPrimaryContainer,
                                                  theme.colorScheme
                                                      .onPrimaryContainer
                                                      .withOpacity(0.6),
                                                  theme.colorScheme
                                                      .onPrimaryContainer
                                                      .withOpacity(1),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailPageContainerPage()),
                                            );
                                          },
                                          child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgE50c016fb6a84163x115,
                                            height: _height / 4.5,
                                            width: _width / 3,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(left: 6),
                                  child: Text(
                                    "Book Title ",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(left: 6, top: 8),
                                  child: Text(
                                    "Main Title ",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodyMediumThin,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(left: 6, top: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 63,
                                        decoration: BoxDecoration(
                                          color: appTheme.teal400,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Select tyep",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(left: 3, top: 1),
                                        child: Text(
                                          "21 min",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: _height / 3.5,
                                      // color: Colors.pink,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        physics: BouncingScrollPhysics(),
                                        separatorBuilder: (
                                          context,
                                          index,
                                        ) {
                                          return SizedBox(
                                            width: getHorizontalSize(10),
                                          );
                                        },
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return ListoneItemWidget();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                provider.recommendedBook.isNotEmpty
                                    ? Padding(
                                        padding: getPadding(top: 31),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Recommended For You",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style:
                                                  theme.textTheme.headlineSmall,
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeRecommendedForYouSeeAllScreen(
                                                            title:
                                                                "Recommended For You",
                                                            books: provider
                                                                .recommendedBook,
                                                          )),
                                                );
                                              },
                                              child: Padding(
                                                padding: getPadding(
                                                    top: 7, bottom: 7),
                                                child: Text(
                                                  "Show all",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .labelLargeTeal400Bold,
                                                ),
                                              ),
                                            ),
                                            CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowrightTeal400,
                                              height: getSize(16),
                                              width: getSize(16),
                                              margin: getMargin(
                                                  left: 4, top: 7, bottom: 7),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                provider.recommendedBook.isNotEmpty
                                    ? Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: getVerticalSize(275),
                                          child: ListView.separated(
                                            physics: BouncingScrollPhysics(),
                                            padding: getPadding(top: 31),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (
                                              context,
                                              index,
                                            ) {
                                              return SizedBox(
                                                width: getHorizontalSize(13),
                                              );
                                            },
                                            itemCount:
                                                provider.recommendedBook.length,
                                            itemBuilder: (context, index) {
                                              BookModel book = provider
                                                  .recommendedBook[index];
                                              return Listtitle1ItemWidget(
                                                book: book,
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                provider.topSearchBook.isNotEmpty
                                    ? Padding(
                                        padding: getPadding(top: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Top Search",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.titleLarge,
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeRecommendedForYouSeeAllScreen(
                                                            title: "Top Search",
                                                            books: provider
                                                                .topSearchBook,
                                                          )),
                                                );
                                              },
                                              child: Padding(
                                                padding: getPadding(
                                                    top: 5, bottom: 5),
                                                child: Text(
                                                  "Show all",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .labelLargeTeal400Bold,
                                                ),
                                              ),
                                            ),
                                            CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowrightTeal400,
                                              height: getSize(16),
                                              width: getSize(16),
                                              margin: getMargin(
                                                  left: 4, top: 4, bottom: 4),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                provider.topSearchBook.isNotEmpty
                                    ? Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: getVerticalSize(275),
                                          child: ListView.separated(
                                            padding: getPadding(top: 16),
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (
                                              context,
                                              index,
                                            ) {
                                              return SizedBox(
                                                width: getHorizontalSize(13),
                                              );
                                            },
                                            itemCount:
                                                provider.topSearchBook.length,
                                            itemBuilder: (context, index) {
                                              BookModel book =
                                                  provider.topSearchBook[index];
                                              return Listtitle1ItemWidget(
                                                book: book,
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                provider.categories.isNotEmpty
                                    ? Padding(
                                        padding: getPadding(top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Categories",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.titleLarge,
                                            ),
                                            Spacer(),
                                            // GestureDetector(
                                            //   onTap: () {
                                            //     Navigator.push(
                                            //       context,
                                            //       MaterialPageRoute(
                                            //           builder: (context) =>
                                            //               HomeRecommendedForYouSeeAllScreen(
                                            //                 Title: "Categories",
                                            //               )),
                                            //     );
                                            //   },
                                            //   child: Padding(
                                            //     padding: getPadding(top: 5, bottom: 5),
                                            //     child: Text(
                                            //       "Show all",
                                            //       overflow: TextOverflow.ellipsis,
                                            //       textAlign: TextAlign.left,
                                            //       style: CustomTextStyles
                                            //           .labelLargeTeal400Bold,
                                            //     ),
                                            //   ),
                                            // ),
                                            // CustomImageView(
                                            //   svgPath: ImageConstant.imgArrowrightTeal400,
                                            //   height: getSize(16),
                                            //   width: getSize(16),
                                            //   margin:
                                            //       getMargin(left: 4, top: 4, bottom: 4),
                                            // ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                provider.categories.isNotEmpty
                                    ? SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics: BouncingScrollPhysics(),
                                        padding: getPadding(top: 16),
                                        child: IntrinsicWidth(
                                          child: Wrap(
                                            runSpacing: getVerticalSize(5),
                                            spacing: getHorizontalSize(5),
                                            children: List<Widget>.generate(
                                                provider.categories.length,
                                                (index) {
                                              String text = provider
                                                      .categories[index].name ??
                                                  'Demo Text';
                                              return Chipviewframefo2ItemWidget(
                                                text: text,
                                              );
                                            }),
                                          ),
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                provider.popularBook.isNotEmpty
                                    ? Padding(
                                        padding: getPadding(
                                          top: 24,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Popular",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.titleLarge,
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeRecommendedForYouSeeAllScreen(
                                                            title: "Popular",
                                                            books: provider
                                                                .popularBook,
                                                          )),
                                                );
                                              },
                                              child: Padding(
                                                padding: getPadding(
                                                  top: 5,
                                                  bottom: 5,
                                                ),
                                                child: Text(
                                                  "Show all",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .labelLargeTeal400Bold,
                                                ),
                                              ),
                                            ),
                                            CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowrightTeal400,
                                              height: getSize(16),
                                              width: getSize(16),
                                              margin: getMargin(
                                                  left: 4, top: 4, bottom: 4),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                provider.popularBook.isNotEmpty
                                    ? Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: getVerticalSize(272),
                                          child: ListView.separated(
                                            padding: getPadding(top: 16),
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (
                                              context,
                                              index,
                                            ) {
                                              return SizedBox(
                                                width: getHorizontalSize(13),
                                              );
                                            },
                                            itemCount:
                                                provider.popularBook.length,
                                            itemBuilder: (context, index) {
                                              BookModel book =
                                                  provider.popularBook[index];
                                              return Listtitle1ItemWidget(
                                                  book: book);
                                            },
                                          ),
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                provider.recentlyAddBook.isNotEmpty
                                    ? Padding(
                                        padding: getPadding(top: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Recently Added",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.titleLarge,
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeRecommendedForYouSeeAllScreen(
                                                            title:
                                                                "Recently Added",
                                                            books: [],
                                                          )),
                                                );
                                              },
                                              child: Padding(
                                                padding: getPadding(
                                                    top: 5, bottom: 5),
                                                child: Text(
                                                  "Show all",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .labelLargeTeal400Bold,
                                                ),
                                              ),
                                            ),
                                            CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgArrowrightTeal400,
                                              height: getSize(16),
                                              width: getSize(16),
                                              margin: getMargin(
                                                  left: 4, top: 4, bottom: 4),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                provider.recentlyAddBook.isNotEmpty
                                    ? Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: getVerticalSize(272),
                                          child: ListView.separated(
                                            padding: getPadding(top: 16),
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (
                                              context,
                                              index,
                                            ) {
                                              return SizedBox(
                                                width: getHorizontalSize(13),
                                              );
                                            },
                                            itemCount: 4,
                                            itemBuilder: (context, index) {
                                              return Listtitle3ItemWidget();
                                            },
                                          ),
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
