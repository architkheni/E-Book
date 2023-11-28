import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/presentation/home_recommended_for_you_see_all_screen/provider/view_all_book_provider.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../my_library_screen/widgets/liste50c016fb6a_item_widget.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  List<Map<String, dynamic>> libraryData = [
    {
      'image': ImageConstant.like,
      'title': 'Favourites',
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
      child: ChangeNotifierProvider(
        create: (context) => ViewAllBookProvider()
          ..getViewAllBooks(param: 'history', key: 'history'),
        child: Consumer<ViewAllBookProvider>(
          builder: (context, viewAllProvider, child) {
            return Scaffold(
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
                              text: 'My Library',
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
                                    if (index == 0) {
                                      context.push(
                                        AppRoutesPath.viewAllBook,
                                        extra: {
                                          'title': 'Favourite',
                                          'param': 'favorites',
                                        },
                                      );
                                    }
                                    if (index == 1) {
                                      context.push(
                                        AppRoutesPath.viewAllBook,
                                        extra: {
                                          'title': 'In Progress',
                                          'param': 'progress',
                                        },
                                      );
                                    }
                                    if (index == 2) {
                                      context.push(
                                        AppRoutesPath.viewAllBook,
                                        extra: {
                                          'title': 'Finished',
                                          'param': 'finished',
                                        },
                                      );
                                    }
                                  },
                                  dense: true,
                                  focusColor: Colors.transparent,
                                  leading: Container(
                                    height: 40,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: isLight
                                            ? ColorConstant.black
                                            : ColorConstant.whiteA700,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(6),
                                      ),
                                    ),
                                    child: CustomImageView(
                                      imagePath: libraryData[index]['image'],
                                      height: 20,
                                      alignment: Alignment.center,
                                      color: isLight
                                          ? ColorConstant.black
                                          : ColorConstant.whiteA700,
                                    ),
                                  ),
                                  title: Text(
                                    libraryData[index]['title'],
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.titleSmallWhiteA700
                                        .copyWith(
                                      color:
                                          isLight ? ColorConstant.black : null,
                                    ),
                                  ),
                                  trailing: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: CustomImageView(
                                      color:
                                          isLight ? ColorConstant.black : null,
                                      svgPath: ImageConstant.imgArrowright,
                                      height: getSize(16),
                                      width: getSize(16),
                                      margin:
                                          getMargin(left: 4, top: 2, bottom: 7),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      if (viewAllProvider.isLoading) ...[
                        Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: ColorConstant.primaryColor,
                            ),
                          ),
                        ),
                      ] else ...[
                        if (viewAllProvider.books.isNotEmpty) ...[
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
                                    context.push(
                                      AppRoutesPath.viewAllBook,
                                      extra: {
                                        'title': 'My History',
                                        'param': 'history',
                                        'jsonKey': 'history',
                                      },
                                    );
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
                                    margin:
                                        getMargin(left: 4, top: 2, bottom: 7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                context
                                    .read<ViewAllBookProvider>()
                                    .getViewAllBooks(
                                      param: 'history',
                                      key: 'history',
                                    );
                              },
                              child: Container(
                                width: double.maxFinite,
                                margin: getMargin(top: 9),
                                child: Padding(
                                  padding: getPadding(left: 17, right: 20),
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: getVerticalSize(12),
                                      );
                                    },
                                    itemCount: viewAllProvider.books.length,
                                    itemBuilder: (context, index) {
                                      return Liste50c016fb6aItemWidget(
                                        book: viewAllProvider.books[index],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ],
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
