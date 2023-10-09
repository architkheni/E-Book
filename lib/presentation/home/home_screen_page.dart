import 'dart:ui';

import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/core/utils/string_utils.dart';
import 'package:book/model/book_model.dart';
import 'package:book/presentation/explore_page/explore_page.dart';
import 'package:book/provider/home_provider.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../detail_page_container_page/detail_page_container_page.dart';
import '../detail_page_container_page/widgets/chipviewframefo2_item_widget.dart';
import '../home_recommended_for_you_see_all_screen/home_recommended_for_you_see_all_screen.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    mediaQueryData = MediaQuery.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Consumer<HomePovider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return Center(
                child: CircularProgressIndicator(color: appTheme.teal400),
              );
            }
            return SizedBox(
              width: width,
              // double.maxFinite,
              child: RefreshIndicator(
                color: appTheme.teal400,
                onRefresh: () async {
                  context.read<HomePovider>().getDashboardDetails();
                },
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 12, left: 16, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(left: 6, bottom: 16),
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
                              text: 'For Me',
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(left: 6),
                          child: Text(
                            'Free book of the Day',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: isLight ? ColorConstant.black : null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(left: 6, top: 10),
                          child: Text(
                            'Selected by our curators',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.bodyMediumThin.copyWith(
                              color: isLight ? ColorConstant.black : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        provider.dashboardModel.mainBook != null
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailPageContainerPage(
                                          bookId: provider.dashboardModel
                                              .mainBook![0].bookId!,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: height / 3,
                                      width: width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            provider.dashboardModel.mainBook![0]
                                                .frontCover!,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: ClipRRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 4,
                                            sigmaY: 4,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  theme.colorScheme
                                                      .onPrimaryContainer
                                                      .withOpacity(0.3),
                                                  theme.colorScheme
                                                      .onPrimaryContainer
                                                      .withOpacity(0.7),
                                                  theme.colorScheme
                                                      .onPrimaryContainer
                                                      .withOpacity(1),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: CustomImageView(
                                          url: provider.dashboardModel
                                              .mainBook![0].frontCover,
                                          height: height / 3.75,
                                          width: width / 2.3,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.mainBook != null &&
                                provider.dashboardModel.mainBook![0].name !=
                                    null
                            ? Padding(
                                padding: getPadding(left: 6, top: 7),
                                child: Text(
                                  provider.dashboardModel.mainBook![0].title!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.titleSmall!.copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.mainBook != null &&
                                provider.dashboardModel.mainBook![0]
                                        .authorName !=
                                    null
                            ? Padding(
                                padding: getPadding(left: 6),
                                child: Text(
                                  "${provider.dashboardModel.mainBook![0].authorName!} & ${provider.dashboardModel.mainBook![0].author2 ?? ''}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStyles.bodyMediumThin.copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.mainBook != null &&
                                provider.dashboardModel.mainBook![0]
                                        .description !=
                                    null
                            ? Padding(
                                padding: getPadding(left: 6),
                                child: Text(
                                  provider.dashboardModel.mainBook![0]
                                          .description ??
                                      '',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStyles.bodyMediumThin.copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.mainBook != null
                            ? Padding(
                                padding: getPadding(left: 6, top: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: appTheme.teal400,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          provider.dashboardModel.mainBook![0]
                                              .type!.capitlize,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.bodySmall!
                                              .copyWith(
                                            color: isLight
                                                ? ColorConstant.black
                                                : null,
                                          ),
                                        ),
                                      ),
                                    ),
                                    provider.dashboardModel.mainBook![0]
                                                .originalAudiobookLength !=
                                            null
                                        ? Padding(
                                            padding: getPadding(
                                              left: 3,
                                              top: 1,
                                            ),
                                            child: Text(
                                              '${provider.dashboardModel.mainBook![0].originalAudiobookLength} min',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(
                                                color: isLight
                                                    ? ColorConstant.black
                                                    : null,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 25),
                        //   child: Align(
                        //     alignment: Alignment.centerRight,
                        //     child: Container(
                        //       height: _height / 3.5,
                        //       // color: Colors.pink,
                        //       child: ListView.separated(
                        //         scrollDirection: Axis.horizontal,
                        //         physics: BouncingScrollPhysics(),
                        //         separatorBuilder: (
                        //           context,
                        //           index,
                        //         ) {
                        //           return SizedBox(
                        //             width: getHorizontalSize(10),
                        //           );
                        //         },
                        //         itemCount: 4,
                        //         itemBuilder: (context, index) {
                        //           return ListoneItemWidget();
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        provider.dashboardModel.recommendedBook.isNotEmpty
                            ? Padding(
                                padding: getPadding(top: 31),
                                child: Row(
                                  children: [
                                    Text(
                                      'Recommended For You',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: theme.textTheme.headlineSmall!
                                          .copyWith(
                                        color: isLight
                                            ? ColorConstant.black
                                            : null,
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeRecommendedForYouSeeAllScreen(
                                              title: 'Recommended For You',
                                              param: 'flag_recommend',
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              top: 7,
                                              bottom: 7,
                                            ),
                                            child: Text(
                                              'Show all',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .labelLargeTeal400Bold,
                                            ),
                                          ),
                                          CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowrightTeal400,
                                            height: getSize(16),
                                            width: getSize(16),
                                            margin: getMargin(
                                              left: 4,
                                              top: 7,
                                              bottom: 7,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.recommendedBook.isNotEmpty
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  height: getVerticalSize(290),
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    padding: getPadding(top: 10),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (
                                      context,
                                      index,
                                    ) {
                                      return SizedBox(
                                        width: getHorizontalSize(13),
                                      );
                                    },
                                    itemCount: provider
                                        .dashboardModel.recommendedBook.length,
                                    itemBuilder: (context, index) {
                                      BookModel book = provider.dashboardModel
                                          .recommendedBook[index];
                                      return BookTile(
                                        book: book,
                                      );
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.topSearchBook.isNotEmpty
                            ? Padding(
                                padding: getPadding(top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'Top Search',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          theme.textTheme.titleLarge!.copyWith(
                                        color: isLight
                                            ? ColorConstant.black
                                            : null,
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeRecommendedForYouSeeAllScreen(
                                              title: 'Top Search',
                                              param: 'flag_top_sell',
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              top: 7,
                                              bottom: 7,
                                            ),
                                            child: Text(
                                              'Show all',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .labelLargeTeal400Bold,
                                            ),
                                          ),
                                          CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowrightTeal400,
                                            height: getSize(16),
                                            width: getSize(16),
                                            margin: getMargin(
                                              left: 4,
                                              top: 7,
                                              bottom: 7,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.topSearchBook.isNotEmpty
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  height: getVerticalSize(290),
                                  child: ListView.separated(
                                    padding: getPadding(top: 16),
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (
                                      context,
                                      index,
                                    ) {
                                      return SizedBox(
                                        width: getHorizontalSize(13),
                                      );
                                    },
                                    itemCount: provider
                                        .dashboardModel.topSearchBook.length,
                                    itemBuilder: (context, index) {
                                      BookModel book = provider
                                          .dashboardModel.topSearchBook[index];
                                      return BookTile(
                                        book: book,
                                      );
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.categories.isNotEmpty
                            ? Padding(
                                padding: getPadding(top: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      'Categories',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          theme.textTheme.titleLarge!.copyWith(
                                        color: isLight
                                            ? ColorConstant.black
                                            : null,
                                      ),
                                    ),
                                    const Spacer(),
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
                            : const SizedBox.shrink(),
                        provider.dashboardModel.categories.isNotEmpty
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                padding: getPadding(top: 16),
                                child: SizedBox(
                                  width: width * 1.75,
                                  child: Wrap(
                                    runSpacing: getVerticalSize(5),
                                    spacing: getHorizontalSize(5),
                                    children: List<Widget>.generate(
                                        provider.dashboardModel.categories
                                            .length, (index) {
                                      String text = provider.dashboardModel
                                              .categories[index].name ??
                                          '';
                                      return Chipviewframefo2ItemWidget(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ExplorePage(
                                                categoryId: provider
                                                    .dashboardModel
                                                    .categories[index]
                                                    .categoryId,
                                                categoryName: provider
                                                    .dashboardModel
                                                    .categories[index]
                                                    .name,
                                              ),
                                            ),
                                          );
                                        },
                                        text: text,
                                      );
                                    }),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.popularBook.isNotEmpty
                            ? Padding(
                                padding: getPadding(
                                  top: 24,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Popular',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          theme.textTheme.titleLarge!.copyWith(
                                        color: isLight
                                            ? ColorConstant.black
                                            : null,
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeRecommendedForYouSeeAllScreen(
                                              title: 'Popular',
                                              param: 'recently_added',
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              top: 7,
                                              bottom: 7,
                                            ),
                                            child: Text(
                                              'Show all',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .labelLargeTeal400Bold,
                                            ),
                                          ),
                                          CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowrightTeal400,
                                            height: getSize(16),
                                            width: getSize(16),
                                            margin: getMargin(
                                              left: 4,
                                              top: 7,
                                              bottom: 7,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.popularBook.isNotEmpty
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  height: getVerticalSize(290),
                                  child: ListView.separated(
                                    padding: getPadding(top: 16),
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (
                                      context,
                                      index,
                                    ) {
                                      return SizedBox(
                                        width: getHorizontalSize(13),
                                      );
                                    },
                                    itemCount: provider
                                        .dashboardModel.popularBook.length,
                                    itemBuilder: (context, index) {
                                      BookModel book = provider
                                          .dashboardModel.popularBook[index];
                                      return BookTile(
                                        book: book,
                                      );
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.recentlyAddBook.isNotEmpty
                            ? Padding(
                                padding: getPadding(top: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      'Recently Added',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          theme.textTheme.titleLarge!.copyWith(
                                        color: isLight
                                            ? ColorConstant.black
                                            : null,
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeRecommendedForYouSeeAllScreen(
                                              title: 'Recently Added',
                                              param: 'recently_added',
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              top: 7,
                                              bottom: 7,
                                            ),
                                            child: Text(
                                              'Show all',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .labelLargeTeal400Bold,
                                            ),
                                          ),
                                          CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowrightTeal400,
                                            height: getSize(16),
                                            width: getSize(16),
                                            margin: getMargin(
                                              left: 4,
                                              top: 7,
                                              bottom: 7,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.recentlyAddBook.isNotEmpty
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  height: getVerticalSize(290),
                                  child: ListView.separated(
                                    padding: getPadding(top: 16),
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (
                                      context,
                                      index,
                                    ) {
                                      return SizedBox(
                                        width: getHorizontalSize(13),
                                      );
                                    },
                                    itemCount: provider
                                        .dashboardModel.recentlyAddBook.length,
                                    itemBuilder: (context, index) {
                                      BookModel book = provider.dashboardModel
                                          .recentlyAddBook[index];
                                      return BookTile(
                                        book: book,
                                      );
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
