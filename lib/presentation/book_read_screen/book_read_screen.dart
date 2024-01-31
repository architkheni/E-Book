// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_local_variable


import 'package:book/core/storage/cache_storage.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/core/utils/string_utils.dart';
import 'package:book/model/book_chapter_model.dart';
import 'package:book/presentation/book_read_screen/provider/book_read_provider.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class BookReadScreen extends StatelessWidget {
  final int bookId;
  const BookReadScreen({Key? key, required this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => BookReadProvider()..getChapter(bookId),
      child: BookReadView(bookId: bookId),
    );
  }
}

class BookReadView extends StatefulWidget {
  final int bookId;
  const BookReadView({Key? key, required this.bookId}) : super(key: key);

  @override
  State<BookReadView> createState() => _BookReadViewState();
}

bool ShowBox = false;
int _currentSliderValue = 1;

class _BookReadViewState extends State<BookReadView> {
  @override
  void initState() {
    ShowBox = false;
    init();
    super.initState();
  }

  init() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  disposFlag() async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  void showNavigationBar() {
    List<String> content = context
        .read<BookReadProvider>()
        .chapters
        .map((e) => '${e.title}')
        .toList();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        bool isLight = !CacheStorage.isDark;
        double height = MediaQuery.of(context).size.height;
        return Container(
          height: height * 80 / 100,
          decoration: BoxDecoration(
            color: isLight ? ColorConstant.whiteA700 : ColorConstant.k181919,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Transform.translate(
                  offset: const Offset(0, -40),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isLight
                            ? ColorConstant.whiteA700
                            : ColorConstant.k181919,
                        shape: BoxShape.circle,
                      ),
                      height: 110,
                      width: 110,
                      child: Center(
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isLight
                                ? ColorConstant.primaryColor
                                : ColorConstant.whiteA700,
                          ),
                          child: Icon(
                            Icons.clear_rounded,
                            size: 60,
                            color: isLight
                                ? ColorConstant.whiteA700
                                : ColorConstant.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 6,
                        ),
                        child: Text(
                          'CONTENTS',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: isLight
                                ? ColorConstant.black
                                : ColorConstant.whiteA700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Divider(color: ColorConstant.k5E5E5E),
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: content.length,
                        itemBuilder: (context, index) {
                          String getTitle() {
                            if (index == 0 || index == content.length - 1) {
                              return index == content.length - 1
                                  ? 'Conclusion'
                                  : content[index];
                            }
                            return '$index. ${content[index]}';
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 6,
                            ),
                            child: Text(
                              getTitle().capitlize,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isLight
                                    ? ColorConstant.black
                                    : ColorConstant.whiteA700,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Divider(color: ColorConstant.k5E5E5E),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    ShowBox = false;
    disposFlag();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isLight = !CacheStorage.isDark;
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
          backgroundColor: isLight ? ColorConstant.whiteA700 : Colors.black,
          appBar: CustomAppBar(
            height: 70,
            leadingWidth: 37,
            leading: IconButton(
              onPressed: () {
                if (ShowBox) {
                  setState(() {
                    ShowBox = false;
                  });
                } else {
                  context.pop();
                }
              },
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 40,
                color: isLight ? ColorConstant.black : ColorConstant.whiteA700,
              ),
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
                onTap: () {
                  showNavigationBar();
                },
                color: isLight ? ColorConstant.black : null,
              ),
            ],
          ),
          body: Consumer<BookReadProvider>(
            builder: (context, provider, child) {
              int position = context
                  .read<BookReadProvider>()
                  .getCurrentChapterPosition(widget.bookId);
              PageController controller =
                  PageController(initialPage: position, keepPage: false);
              return provider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: appTheme.teal400),
                    )
                  : Stack(
                      children: [
                        SizedBox(
                          height: height,
                          width: width,
                          child: PageView.builder(
                            allowImplicitScrolling: true,
                            controller: controller,
                            onPageChanged: (value) {
                              if (value != 0 ||
                                  value != provider.chapters.length - 1) {
                                context.read<BookReadProvider>().readChapter(
                                      widget.bookId,
                                      provider.chapters[value].id!,
                                    );
                              }
                              context
                                  .read<BookReadProvider>()
                                  .saveCurrentChapterPosition(
                                    widget.bookId,
                                    value,
                                  );
                            },
                            itemBuilder: (context, index) {
                              BookChapterModel chapter =
                                  provider.chapters[index];
                              return Column(
                                children: [
                                  Expanded(
                                    child: Pages(
                                      chapter: chapter,
                                      fontSize: _currentSliderValue,
                                      isLight: isLight,
                                      isLast:
                                          index == provider.chapters.length - 1,
                                    ),
                                  ),
                                  if (index ==
                                      provider.chapters.length - 1) ...[
                                    CustomElevatedButton(
                                      onTap: () {},
                                      width: double.maxFinite,
                                      height: getVerticalSize(
                                        48,
                                      ),
                                      text: 'Mark As Finish',
                                      margin: getMargin(
                                        top: 10,
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                      ),
                                      buttonStyle:
                                          CustomButtonStyles.fillTeal400,
                                      buttonTextStyle: CustomTextStyles
                                          .titleSmallPrimary_1
                                          .copyWith(
                                        color: isLight
                                            ? ColorConstant.whiteA700
                                            : null,
                                      ),
                                    ),
                                  ],
                                ],
                              );
                            },
                            physics: const BouncingScrollPhysics(),
                            itemCount: provider.chapters.length,
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
                                        mainAxisSize: MainAxisSize.min,
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
                                                  const SizedBox(width: 10),
                                                  CustomImageView(
                                                    height: 15,
                                                    imagePath:
                                                        ImageConstant.textImage,
                                                    color: isLight
                                                        ? ColorConstant.black
                                                        : null,
                                                  ),
                                                  Expanded(
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
                                                  CustomImageView(
                                                    height: 23,
                                                    imagePath:
                                                        ImageConstant.textImage,
                                                    color: isLight
                                                        ? ColorConstant.black
                                                        : null,
                                                  ),
                                                  const SizedBox(width: 10),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16,
                                              right: 16,
                                              bottom: 20,
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
                                                          CacheStorage.isDark =
                                                              false;
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
                                                          decoration:
                                                              BoxDecoration(
                                                            border: isLight
                                                                ? Border.all(
                                                                    color: appTheme
                                                                        .teal400,
                                                                    width: 2,
                                                                  )
                                                                : null,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                13,
                                                              ),
                                                            ),
                                                            color: ColorConstant
                                                                .whiteA700,
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
                                                                color: appTheme
                                                                    .black900,
                                                                fontSize: 22,
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
                                                          CacheStorage.isDark =
                                                              true;
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
                                                          decoration:
                                                              BoxDecoration(
                                                            border: !isLight
                                                                ? Border.all(
                                                                    color: appTheme
                                                                        .teal400,
                                                                    width: 2,
                                                                  )
                                                                : null,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                13,
                                                              ),
                                                            ),
                                                            color: ColorConstant
                                                                .black,
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
                                                                color: appTheme
                                                                    .whiteA700,
                                                                fontSize: 22,
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
  int fontSize;
  bool isLight;
  bool isLast;

  Pages({
    Key? key,
    required this.chapter,
    required this.fontSize,
    required this.isLight,
    required this.isLast,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bold = 22 + fontSize.toInt();
    var NormalFont = 17 + fontSize.toInt();
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              isLast ? 'Conclusion' : '${chapter.title?.capitlize}',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: isLight ? ColorConstant.black : ColorConstant.whiteA700,
                fontSize: bold.toDouble(),
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Html(
                data: '${chapter.description}',
                style: {
                  '*': Style(
                    color:
                        isLight ? ColorConstant.black : ColorConstant.whiteA700,
                    fontSize: FontSize(NormalFont.toDouble()),
                    fontFamily: 'outfit',
                  ),
                },
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
