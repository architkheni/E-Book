import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/book_model.dart';
import 'package:book/presentation/home_recommended_for_you_see_all_screen/provider/view_all_book_provider.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
                                      AppRoutesPath.history,
                                      extra: {
                                        'title': 'My History',
                                        'param': 'history',
                                        'jsonKey': 'history',
                                      },
                                    ).then(
                                      (value) => context
                                          .read<ViewAllBookProvider>()
                                          .getViewAllBooks(
                                            param: 'history',
                                            key: 'history',
                                          ),
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
                              child: Padding(
                                padding:
                                    getPadding(left: 20, right: 20, top: 8),
                                child: GroupedListView<BookModel, DateTime>(
                                  order: GroupedListOrder.DESC,
                                  elements: viewAllProvider.books,
                                  groupBy: (element) {
                                    String date = element.updatedAt ??
                                        DateTime.now().toString();
                                    if (date.isEmpty) {
                                      date = DateTime.now().toString();
                                    }
                                    return DateFormat('yyyy-MM-dd').parse(date);
                                  },
                                  groupSeparatorBuilder: (groupByValue) =>
                                      const SizedBox.shrink(),
                                  itemBuilder: (context, book) {
                                    double width =
                                        MediaQuery.of(context).size.width;
                                    double height =
                                        MediaQuery.of(context).size.height;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.push(
                                            AppRoutesPath.bookDetail,
                                            extra: book.bookId!,
                                          );
                                        },
                                        child: Container(
                                          decoration:
                                              AppDecoration.fill4.copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8,
                                            color: isLight
                                                ? ColorConstant.kF3F3F3
                                                : null,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                  9.0,
                                                ),
                                                child: CustomImageView(
                                                  url: book.frontCover,
                                                  height: width / 5 * 1.5,
                                                  width: width / 5,
                                                  fit: BoxFit.fill,
                                                  radius: BorderRadius.circular(
                                                    5,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            book.name ??
                                                                'Book Name',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: theme
                                                                .textTheme
                                                                .titleSmall!
                                                                .copyWith(
                                                              color: isLight
                                                                  ? ColorConstant
                                                                      .black
                                                                  : null,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                        book.freeBook! == 0
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  right: 10,
                                                                  bottom: 7,
                                                                ),
                                                                child:
                                                                    CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgLockTeal400,
                                                                  height: 16,
                                                                  width: 13,
                                                                ),
                                                              )
                                                            : const SizedBox
                                                                .shrink(),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: height / 9,
                                                      width: width / 1.4,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Column(
                                                              children: [
                                                                const Spacer(),
                                                                Row(
                                                                  children: [
                                                                    CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgGgread,
                                                                      height:
                                                                          16,
                                                                      width: 16,
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        left: 4,
                                                                        top: 1,
                                                                        bottom:
                                                                            1,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        '${book.originalAudiobookLength ?? 0}m',
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                        style: CustomTextStyles
                                                                            .bodySmallTeal400
                                                                            .copyWith(
                                                                          color: isLight
                                                                              ? ColorConstant.black
                                                                              : null,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const Spacer(),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 20.0,
                                                              ),
                                                              child: Text(
                                                                '${book.description}',
                                                                maxLines: 3,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .bodySmallThin_1
                                                                    .copyWith(
                                                                  color: isLight
                                                                      ? ColorConstant
                                                                          .black
                                                                      : null,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
