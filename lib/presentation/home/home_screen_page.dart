import 'dart:ui';

import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/core/utils/string_utils.dart';
import 'package:book/provider/explore_provider.dart';
import 'package:book/provider/home_provider.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../detail_page_container_page/widgets/chipviewframefo2_item_widget.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  void initState() {
    super.initState();
    context.read<HomePovider>().getDashboardDetails();
    context.read<ExploreProvider>().getAllCategories();
    context.read<WishlistProvider>().getWishListBook();
  }

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    mediaQueryData = MediaQuery.of(context);
    double width = MediaQuery.of(context).size.width;
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
                            'Free Book of the Day',
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
                                  context.push(
                                    AppRoutesPath.bookDetail,
                                    extra: provider
                                        .dashboardModel.mainBook!.bookId!,
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: (width / 2.3) * 1.8,
                                      width: width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            provider.dashboardModel.mainBook!
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
                                          url: provider.dashboardModel.mainBook!
                                              .frontCover,
                                          height: (width / 2.3) * 1.5,
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
                                provider.dashboardModel.mainBook!.name != null
                            ? Padding(
                                padding: getPadding(left: 6, top: 7),
                                child: Text(
                                  provider.dashboardModel.mainBook!.title!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.titleSmall!.copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                    fontSize: 17,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.mainBook != null &&
                                provider.dashboardModel.mainBook!.authorName !=
                                    null
                            ? Padding(
                                padding: getPadding(left: 6),
                                child: Builder(
                                  builder: (context) {
                                    String author = '';
                                    List<dynamic> list = (provider
                                            .dashboardModel
                                            .mainBook!
                                            .authorName as List<dynamic>)
                                        .where((element) => element != null)
                                        .toList();

                                    for (var i = 0; i < list.length; i++) {
                                      author += list[i];
                                      author +=
                                          ((list.length - 1) == i) ? '' : ', ';
                                    }

                                    return Text(
                                      author,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.bodyMediumThin
                                          .copyWith(
                                        color: isLight
                                            ? ColorConstant.black
                                            : null,
                                        fontSize: 17,
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.mainBook != null &&
                                provider.dashboardModel.mainBook!.description !=
                                    null
                            ? Padding(
                                padding: getPadding(left: 6),
                                child: Text(
                                  provider.dashboardModel.mainBook!
                                          .description ??
                                      '',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStyles.bodyMediumThin.copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.dashboardModel.mainBook != null
                            ? Padding(
                                padding: getPadding(left: 6, top: 5),
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
                                          provider.dashboardModel.mainBook!
                                              .type!.capitlize,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.bodySmall!
                                              .copyWith(
                                            color: isLight
                                                ? ColorConstant.black
                                                : null,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    provider.dashboardModel.mainBook!
                                                .originalAudiobookLength !=
                                            null
                                        ? Padding(
                                            padding: getPadding(
                                              left: 3,
                                              top: 1,
                                            ),
                                            child: Text(
                                              '${provider.dashboardModel.mainBook!.originalAudiobookLength} min',
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
                                        context.push(
                                          AppRoutesPath.viewAllBook,
                                          extra: {
                                            'title': 'Recommended For You',
                                            'param': 'flag_recommend',
                                          },
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
                            ? Padding(
                                padding: getPadding(top: 20, bottom: 20),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      provider.dashboardModel.recommendedBook
                                          .length,
                                      (index) => BookTile(
                                        book: provider.dashboardModel
                                            .recommendedBook[index],
                                      ),
                                    ),
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
                                        context.push(
                                          AppRoutesPath.viewAllBook,
                                          extra: {
                                            'title': 'Top Search',
                                            'param': 'flag_top_sell',
                                          },
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
                            ? Padding(
                                padding: getPadding(top: 20, bottom: 20),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      provider
                                          .dashboardModel.topSearchBook.length,
                                      (index) => BookTile(
                                        book: provider.dashboardModel
                                            .topSearchBook[index],
                                      ),
                                    ),
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
                                      String icon = provider.dashboardModel
                                              .categories[index].icon ??
                                          '';

                                      return Chipviewframefo2ItemWidget(
                                        onTap: () {
                                          context.push(
                                            AppRoutesPath.explore,
                                            extra: {
                                              'categoryId': provider
                                                  .dashboardModel
                                                  .categories[index]
                                                  .categoryId,
                                              'categoryName': provider
                                                  .dashboardModel
                                                  .categories[index]
                                                  .name,
                                            },
                                          );
                                        },
                                        text: text,
                                        icon: icon,
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
                                        context.push(
                                          AppRoutesPath.viewAllBook,
                                          extra: {
                                            'title': 'Popular',
                                            'param': 'recently_added',
                                          },
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
                            ? Padding(
                                padding: getPadding(top: 20, bottom: 20),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      provider
                                          .dashboardModel.popularBook.length,
                                      (index) => BookTile(
                                        book: provider
                                            .dashboardModel.popularBook[index],
                                      ),
                                    ),
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
                                        context.push(
                                          AppRoutesPath.viewAllBook,
                                          extra: {
                                            'title': 'Recently Added',
                                            'param': 'recently_added',
                                          },
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
                            ? Padding(
                                padding: getPadding(top: 20, bottom: 20),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      provider.dashboardModel.recentlyAddBook
                                          .length,
                                      (index) => BookTile(
                                        book: provider.dashboardModel
                                            .recentlyAddBook[index],
                                      ),
                                    ),
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
