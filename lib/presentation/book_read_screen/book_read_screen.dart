// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/book_chapter_model.dart';
import 'package:book/presentation/book_read_screen/provider/book_read_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class BookReadScreen extends StatelessWidget {
  final int bookId;
  const BookReadScreen({Key? key, required this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => BookReadProvider()..getChapter(bookId),
      child: const BookReadView(),
    );
  }
}

class BookReadView extends StatefulWidget {
  const BookReadView({Key? key}) : super(key: key);

  @override
  State<BookReadView> createState() => _BookReadViewState();
}

bool ShowBox = false;
int _currentSliderValue = 1;
String fontFamily = 'Roboto';
int ShowBorder = 0;

class _BookReadViewState extends State<BookReadView> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  void initState() {
    ShowBox = false;
    ShowBorder = 0;
    super.initState();
  }

  @override
  void dispose() {
    ShowBox = false;
    ShowBorder = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    PageController controller = PageController();
    bool isLight = Theme.of(context).brightness == Brightness.light;
    int curr = 0;

    return WillPopScope(
      onWillPop: () async {
        if (ShowBox) {
          setState(() {
            ShowBox = false;
          });
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CustomAppBar(
            height: 70,
            leadingWidth: 37,
            leading: AppbarImage(
              onTap: () {
                if (ShowBox) {
                  setState(() {
                    ShowBox = false;
                  });
                } else {
                  Navigator.pop(context);
                }
              },
              height: 24,
              width: 24,
              color: isLight ? ColorConstant.black : null,
              imagePath: ImageConstant.downArrow,
              margin: getMargin(left: 13, top: 16, bottom: 16),
            ),
            actions: [
              AppbarImage(
                height: 17,
                width: 21,
                imagePath: ImageConstant.textImage,
                color: isLight ? ColorConstant.black : null,
                margin: getMargin(left: 16, top: 19, right: 16, bottom: 4),
                onTap: () {
                  if (ShowBox == false) {
                    ShowBox = true;
                  } else {
                    ShowBox = false;
                  }
                  setState(() {});
                },
              ),
              AppbarImage(
                height: 24,
                width: 24,
                imagePath: ImageConstant.option,
                margin: getMargin(left: 9, top: 16, right: 32),
                onTap: () {},
                color: isLight ? ColorConstant.black : null,
              ),
            ],
          ),
          body: Consumer<BookReadProvider>(
            builder: (context, provider, child) {
              return provider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: appTheme.teal400),
                    )
                  : Stack(
                      children: [
                        SizedBox(
                          height: height,
                          width: width,
                          child: PageView(
                            allowImplicitScrolling: true,
                            scrollDirection: Axis.horizontal,
                            controller: controller,
                            onPageChanged: (n) {
                              setState(() {
                                curr = n;
                                if ((provider.chapters.length - 1) == n) {}
                              });
                            },
                            children: provider.chapters
                                .map(
                                  (e) => Center(
                                    child: Pages(
                                      text: 'Page Three',
                                      chapter: e,
                                      color: Colors.grey,
                                      fontSize: _currentSliderValue,
                                      fontFamily: fontFamily,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        ShowBox == true
                            ? Container(
                                color: const Color.fromARGB(210, 32, 32, 32),
                                height: height,
                                width: width,
                                child: Column(
                                  children: [
                                    Container(
                                      height: height / 3.5,
                                      width: width,
                                      color: isLight
                                          ? ColorConstant.whiteA700
                                          : const Color.fromARGB(
                                              255,
                                              32,
                                              32,
                                              32,
                                            ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: SizedBox(
                                              height: height / 13,
                                              width: width,
                                              // color: Colors.blue[200],
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 10,
                                                    ),
                                                    child: CustomImageView(
                                                      height: 15,
                                                      width: 15,
                                                      imagePath: ImageConstant
                                                          .textImage,
                                                      color: isLight
                                                          ? ColorConstant.black
                                                          : null,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width - 60,
                                                    child: Slider(
                                                      value: _currentSliderValue
                                                          .toDouble(),
                                                      max: 10,
                                                      activeColor:
                                                          appTheme.teal400,
                                                      inactiveColor: isLight
                                                          ? ColorConstant
                                                              .kF3F3F3
                                                          : appTheme.whiteA700,
                                                      // thumbColor: Colors.transparent,
                                                      label: _currentSliderValue
                                                          .round()
                                                          .toString(),
                                                      onChanged:
                                                          (double value) {
                                                        setState(() {
                                                          _currentSliderValue =
                                                              value.toInt();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 10,
                                                    ),
                                                    child: CustomImageView(
                                                      height: 23,
                                                      width: 23,
                                                      imagePath: ImageConstant
                                                          .textImage,
                                                      color: isLight
                                                          ? ColorConstant.black
                                                          : null,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16,
                                              right: 16,
                                            ),
                                            child: SizedBox(
                                              height: height / 13,
                                              width: width,
                                              // color: Colors.blue[800],
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          fontFamily = 'Roboto';
                                                          ShowBorder = 1;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(
                                                          7.0,
                                                        ),
                                                        child: Container(
                                                          height: height,
                                                          width: width,
                                                          decoration: ShowBorder ==
                                                                  1
                                                              ? BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: appTheme
                                                                        .teal400,
                                                                    width: 2,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                      13,
                                                                    ),
                                                                  ),
                                                                )
                                                              : BoxDecoration(
                                                                  color: isLight
                                                                      ? ColorConstant
                                                                          .kF3F3F3
                                                                      : ColorConstant
                                                                          .whiteA700,
                                                                  border: !isLight
                                                                      ? Border.all(
                                                                          width:
                                                                              2,
                                                                        )
                                                                      : null,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                      13,
                                                                    ),
                                                                  ),
                                                                ),
                                                          child: Center(
                                                            child: Text(
                                                              'Aa',
                                                              maxLines: 5,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: ShowBorder ==
                                                                        1
                                                                    ? isLight
                                                                        ? appTheme
                                                                            .black900
                                                                        : appTheme
                                                                            .whiteA700
                                                                    : appTheme
                                                                        .black900,
                                                                fontSize: 22,
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          fontFamily = 'Outfit';
                                                          ShowBorder = 2;
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(
                                                          7.0,
                                                        ),
                                                        child: Container(
                                                          height: height,
                                                          width: width,
                                                          decoration: ShowBorder ==
                                                                  2
                                                              ? BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: appTheme
                                                                        .teal400,
                                                                    width: 2,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                      13,
                                                                    ),
                                                                  ),
                                                                )
                                                              : BoxDecoration(
                                                                  color: isLight
                                                                      ? ColorConstant
                                                                          .kF3F3F3
                                                                      : ColorConstant
                                                                          .whiteA700,
                                                                  border: !isLight
                                                                      ? Border.all(
                                                                          width:
                                                                              2,
                                                                        )
                                                                      : null,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                      13,
                                                                    ),
                                                                  ),
                                                                ),
                                                          child: Center(
                                                            child: Text(
                                                              'Aa',
                                                              maxLines: 5,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: ShowBorder ==
                                                                        2
                                                                    ? isLight
                                                                        ? appTheme
                                                                            .black900
                                                                        : appTheme
                                                                            .whiteA700
                                                                    : appTheme
                                                                        .black900,
                                                                fontSize: 22,
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16,
                                              right: 16,
                                              top: 20,
                                            ),
                                            child: CustomElevatedButton(
                                              onTap: () {
                                                setState(() {
                                                  ShowBox = false;
                                                });
                                              },
                                              width: double.maxFinite,
                                              height: getVerticalSize(48),
                                              text: 'Continue',
                                              // margin: getMargin(top: 74),
                                              buttonStyle: CustomButtonStyles
                                                  .fillTeal400,
                                              buttonTextStyle: CustomTextStyles
                                                  .titleSmallPrimary_1
                                                  .copyWith(
                                                color: isLight
                                                    ? ColorConstant.whiteA700
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Pages extends StatelessWidget {
  final BookChapterModel chapter;
  final text;
  final color;
  int fontSize;
  String fontFamily;

  Pages({
    Key? key,
    this.text,
    this.color,
    required this.fontSize,
    required this.fontFamily,
    required this.chapter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    var bold = 22 + fontSize.toInt();
    var NormalFont = 17 + fontSize.toInt();
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              chapter.title!,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: isLight ? ColorConstant.black : ColorConstant.whiteA700,
                fontSize: bold.toDouble(),
                fontFamily: fontFamily,
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Html(
                    data: chapter.description!,
                    style: {
                      '*': Style(
                        color: isLight
                            ? ColorConstant.black
                            : ColorConstant.whiteA700,
                        fontSize: FontSize(NormalFont.toDouble()),
                      ),
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
