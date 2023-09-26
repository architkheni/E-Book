import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/book_model.dart';
import 'package:book/presentation/detail_page_container_page/detail_page_container_page.dart';
import 'package:book/presentation/home_recommended_for_you_see_all_screen/provider/view_all_book_provider.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
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
              return Padding(
                padding: const EdgeInsets.only(left: 17, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${provider.books.length} Items',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.titleSmallWhiteA700.copyWith(
                            color: isLight ? ColorConstant.black : null,
                          ),
                        ),
                        const Spacer(),
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
                          style: CustomTextStyles.titleSmallWhiteA700.copyWith(
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
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: <String>['A to Z', 'Z to A']
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
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                        itemCount: provider.books.length,
                        itemBuilder: (context, index) {
                          List<BookModel> books = selectedValue == 'Z to A'
                              ? provider.books.reversed.toList()
                              : provider.books;
                          BookModel book = books[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPageContainerPage(
                                    bookId: book.bookId!,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: AppDecoration.fill4.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8,
                                color: isLight ? ColorConstant.kF3F3F3 : null,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: CustomImageView(
                                      url: book.frontCover,
                                      height: height / 8,
                                      width: width / 5,
                                      fit: BoxFit.fill,
                                      radius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                        top: 1,
                                        bottom: 4,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                book.name ?? 'Book Name',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: theme
                                                    .textTheme.labelLarge!
                                                    .copyWith(
                                                  color: isLight
                                                      ? ColorConstant.black
                                                      : null,
                                                ),
                                              ),
                                              const Spacer(),
                                              widget.title == 'In Progress'
                                                  ? const SizedBox()
                                                  : widget.title == 'Finished'
                                                      ? const SizedBox()
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            right: 10,
                                                            bottom: 7,
                                                          ),
                                                          child:
                                                              CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgLockTeal400,
                                                            height: 16,
                                                            width: 13,
                                                          ),
                                                        ),
                                            ],
                                          ),
                                          SizedBox(
                                            // color: Colors.deepPurple,
                                            height: height / 9,
                                            width: width / 1.4,
                                            child: Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Column(
                                                    children: [
                                                      const Spacer(),
                                                      Row(
                                                        children: [
                                                          CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgGgread,
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 4,
                                                              top: 1,
                                                              bottom: 1,
                                                            ),
                                                            child: Text(
                                                              '${book.originalAudiobookLength ?? 0}m',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: CustomTextStyles
                                                                  .bodySmallTeal400
                                                                  .copyWith(
                                                                color: isLight
                                                                    ? ColorConstant
                                                                        .black
                                                                    : null,
                                                              ),
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          widget.title ==
                                                                  'Finished'
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    right: 10,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    height: 20,
                                                                    width: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        5,
                                                                      ),
                                                                      color: appTheme
                                                                          .teal400,
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        'Finished',
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                        style: theme
                                                                            .textTheme
                                                                            .labelLarge!
                                                                            .copyWith(
                                                                          color: isLight
                                                                              ? ColorConstant.black
                                                                              : null,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              : const SizedBox(),
                                                        ],
                                                      ),
                                                      widget.title ==
                                                              'In Progress'
                                                          ? Row(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      Container(
                                                                    height: 3,
                                                                    width:
                                                                        width /
                                                                            3,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        5,
                                                                      ),
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
                                                                      value:
                                                                          0.4,
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  '10/20',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: CustomTextStyles
                                                                      .bodySmallThin_1,
                                                                ),
                                                              ],
                                                            )
                                                          : const SizedBox(),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    '${book.description}',
                                                    maxLines: 5,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles
                                                        .bodySmallThin_1
                                                        .copyWith(
                                                      color: isLight
                                                          ? ColorConstant.black
                                                          : null,
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
    Navigator.pop(context);
  }
}
