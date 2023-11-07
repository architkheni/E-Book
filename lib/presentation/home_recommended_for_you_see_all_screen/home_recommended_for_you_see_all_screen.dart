import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/book_model.dart';
import 'package:book/presentation/home_recommended_for_you_see_all_screen/provider/view_all_book_provider.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeRecommendedForYouSeeAllScreen extends StatefulWidget {
  final String title;
  final String param;
  final String? jsonKey;
  const HomeRecommendedForYouSeeAllScreen({
    Key? key,
    required this.title,
    required this.param,
    this.jsonKey,
  }) : super(key: key);

  @override
  State<HomeRecommendedForYouSeeAllScreen> createState() =>
      _HomeRecommendedForYouSeeAllScreenState();
}

class _HomeRecommendedForYouSeeAllScreenState
    extends State<HomeRecommendedForYouSeeAllScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  String selectedValue = 'A to Z';

  List<String> filterOption = ['A to Z', 'Z to A'];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    if (widget.param == 'progress' || widget.param == 'favorites') {
      filterOption.add('Least Progress');
      filterOption.add('Most Progress');
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return ChangeNotifierProvider(
      create: (context) => ViewAllBookProvider()
        ..getViewAllBooks(param: widget.param, key: widget.jsonKey),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CustomAppBar(
            height: 60,
            leadingWidth: 35,
            leading: AppbarImage(
              height: 20,
              width: 15,
              svgPath: ImageConstant.imgArrowleftBlueGray50,
              margin: getMargin(left: 16, top: 17, bottom: 18),
              onTap: () {
                onTapArrowleft2(context);
              },
              color: isLight ? ColorConstant.black : null,
            ),
            title: Padding(
              padding: getPadding(left: 11),
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
                  text: widget.title,
                ),
              ),
            ),
          ),
          body: Consumer<ViewAllBookProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: appTheme.teal400),
                );
              }
              List<BookModel> books = provider.books;
              if (widget.param == 'favorites') {
                List<int> bookId = context.read<WishlistProvider>().bookId;
                books = books
                    .where((element) => bookId.contains(element.bookId))
                    .toList();
              }
              if (widget.param != 'finished') {
                if (selectedValue == 'A to Z') {
                  books.sort((a, b) => a.name!.compareTo(b.name!));
                } else if (selectedValue == 'Z to A') {
                  books.sort((a, b) => a.name!.compareTo(b.name!));
                  books = books.reversed.toList();
                } else if (selectedValue == 'Least Progress') {
                  books.sort(
                    (a, b) => (a.readCahpters! / a.totalChapters!) >
                            (b.readCahpters! / b.totalChapters!)
                        ? 1
                        : -1,
                  );
                } else if (selectedValue == 'Most Progress') {
                  books.sort(
                    (a, b) => (a.readCahpters! / a.totalChapters!) >
                            (b.readCahpters! / b.totalChapters!)
                        ? -1
                        : 1,
                  );
                }
              }
              return Padding(
                padding: const EdgeInsets.only(left: 17, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${books.length} Items',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.titleSmallWhiteA700.copyWith(
                            color: isLight ? ColorConstant.black : null,
                          ),
                        ),
                        const Spacer(),
                        if (widget.param != 'history' &&
                            widget.param != 'finished') ...[
                          Text(
                            'Sort By  ',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.bodyMediumGray400.copyWith(
                              color: isLight ? ColorConstant.black : null,
                            ),
                          ),
                          DropdownButton<String>(
                            // padding: EdgeInsets.zero,
                            isDense: true,
                            underline: const SizedBox.shrink(),
                            style:
                                CustomTextStyles.titleSmallWhiteA700.copyWith(
                              color: isLight ? ColorConstant.black : null,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: isLight
                                  ? ColorConstant.black
                                  : appTheme.whiteA700,
                            ),
                            value: selectedValue,
                            dropdownColor: isLight
                                ? ColorConstant.whiteA700
                                : theme.colorScheme.onPrimaryContainer
                                    .withOpacity(1),
                            onChanged: (newValue) {
                              if (selectedValue != newValue) {
                                setState(() {
                                  selectedValue = newValue!;
                                });
                              }
                            },
                            items: filterOption
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: isLight ? ColorConstant.black : null,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: widget.param == 'favorites' && books.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                  height: 150,
                                  imagePath: isLight
                                      ? ImageConstant.favouriteEmptyLight
                                      : ImageConstant.favouriteEmptyDark,
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  'Powerful ideas at your fingertips',
                                  style: TextStyle(
                                    color: isLight
                                        ? ColorConstant.black
                                        : ColorConstant.kEAF4F4,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'save the titles that catch your interest right here',
                                  style: TextStyle(
                                    color: isLight
                                        ? ColorConstant.black
                                        : ColorConstant.kEAF4F4,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            )
                          : widget.param == 'progress' && provider.books.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                      height: 150,
                                      imagePath: isLight
                                          ? ImageConstant.progressEmptyLight
                                          : ImageConstant.progressEmptyDark,
                                    ),
                                    const SizedBox(height: 18),
                                    Text(
                                      'Powerful reading at your time',
                                      style: TextStyle(
                                        color: isLight
                                            ? ColorConstant.black
                                            : ColorConstant.kEAF4F4,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'save the titles that catch your interest right here',
                                      style: TextStyle(
                                        color: isLight
                                            ? ColorConstant.black
                                            : ColorConstant.kEAF4F4,
                                        fontWeight: FontWeight.w100,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                )
                              : widget.param == 'finished' &&
                                      provider.books.isEmpty
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomImageView(
                                          height: 150,
                                          imagePath: isLight
                                              ? ImageConstant.finishedEmptyLight
                                              : ImageConstant.finishedEmptyDark,
                                        ),
                                        const SizedBox(height: 18),
                                        Text(
                                          'We are waiting for your first finished book',
                                          style: TextStyle(
                                            color: isLight
                                                ? ColorConstant.black
                                                : ColorConstant.kEAF4F4,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    )
                                  : ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(height: 10);
                                      },
                                      itemCount: books.length,
                                      itemBuilder: (context, index) {
                                        BookModel book = books[index];
                                        return GestureDetector(
                                          onTap: () {
                                            context
                                                .push(
                                              AppRoutesPath.bookDetail,
                                              extra: book.bookId!,
                                            )
                                                .then((value) {
                                              if (widget.param == 'favorites') {
                                                setState(() {});
                                              }
                                            });
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
                                                    radius:
                                                        BorderRadius.circular(
                                                      5,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 5,
                                                      top: 1,
                                                      bottom: 4,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              book.name ??
                                                                  'Book Name',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
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
                                                            const Spacer(),
                                                            widget.title ==
                                                                    'In Progress'
                                                                ? const SizedBox()
                                                                : widget.title ==
                                                                        'Finished'
                                                                    ? const SizedBox()
                                                                    : book.freeBook! ==
                                                                            0
                                                                        ? Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(
                                                                              right: 10,
                                                                              bottom: 7,
                                                                            ),
                                                                            child:
                                                                                CustomImageView(
                                                                              svgPath: ImageConstant.imgLockTeal400,
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
                                                            alignment: Alignment
                                                                .topCenter,
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
                                                                              ImageConstant.imgGgread,
                                                                          height:
                                                                              16,
                                                                          width:
                                                                              16,
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(
                                                                            left:
                                                                                4,
                                                                            top:
                                                                                1,
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
                                                                            style:
                                                                                CustomTextStyles.bodySmallTeal400.copyWith(
                                                                              color: isLight ? ColorConstant.black : null,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const Spacer(),
                                                                        widget.title ==
                                                                                'Finished'
                                                                            ? Padding(
                                                                                padding: const EdgeInsets.only(
                                                                                  right: 10,
                                                                                ),
                                                                                child: Container(
                                                                                  height: 20,
                                                                                  width: 70,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(
                                                                                      5,
                                                                                    ),
                                                                                    color: appTheme.teal400,
                                                                                  ),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      'Finished',
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      textAlign: TextAlign.left,
                                                                                      style: theme.textTheme.labelLarge!.copyWith(
                                                                                        color: isLight ? ColorConstant.black : null,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            : const SizedBox(),
                                                                      ],
                                                                    ),
                                                                    widget.param ==
                                                                                'progress' ||
                                                                            widget.param ==
                                                                                'favorites'
                                                                        ? Row(
                                                                            children: [
                                                                              Align(
                                                                                alignment: Alignment.centerLeft,
                                                                                child: Container(
                                                                                  height: 3,
                                                                                  width: width / 3,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(
                                                                                      5,
                                                                                    ),
                                                                                    // color: appTheme
                                                                                    //     .teal400,
                                                                                  ),
                                                                                  child: LinearProgressIndicator(
                                                                                    color: appTheme.teal400,
                                                                                    backgroundColor: appTheme.whiteA700,
                                                                                    value: book.readCahpters! / book.totalChapters!,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 7,
                                                                              ),
                                                                              Text(
                                                                                '${book.readCahpters}/${book.totalChapters}',
                                                                                overflow: TextOverflow.ellipsis,
                                                                                textAlign: TextAlign.left,
                                                                                style: CustomTextStyles.bodySmallThin_1.copyWith(color: isLight ? Colors.black : null),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        : const SizedBox(),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
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
                                                                      fontSize:
                                                                          12,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  ///Handling route based on bottom click actions

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft2(BuildContext context) {
    context.pop();
  }
}
