import 'package:book/core/storage/app_storage.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/core/utils/image_constant.dart';
import 'package:book/core/utils/size_utils.dart';
import 'package:book/model/book_model.dart';
import 'package:book/presentation/home_recommended_for_you_see_all_screen/provider/view_all_book_provider.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/theme/app_decoration.dart';
import 'package:book/theme/custom_text_style.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:book/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../theme/theme_helper.dart';

class HistoryScreen extends StatefulWidget {
  final String title;
  final String param;
  final String? jsonKey;
  const HistoryScreen({
    Key? key,
    required this.title,
    required this.param,
    this.jsonKey,
  }) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
                context.pop();
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
              return Padding(
                padding: const EdgeInsets.only(left: 17, right: 20),
                child: Column(
                  children: [
                    Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (notification) {
                          notification.disallowIndicator();
                          return false;
                        },
                        child: GroupedListView<BookModel, DateTime>(
                          order: GroupedListOrder.DESC,
                          elements: books,
                          groupBy: (element) {
                            String date =
                                element.updatedAt ?? DateTime.now().toString();
                            if (date.isEmpty) {
                              date = DateTime.now().toString();
                            }
                            return DateFormat('yyyy-MM-dd').parse(date);
                          },
                          groupSeparatorBuilder: (groupByValue) {
                            String getMonth() {
                              switch (groupByValue.month) {
                                case 1:
                                  return 'January';
                                case 2:
                                  return 'February';
                                case 3:
                                  return 'March';
                                case 4:
                                  return 'April';
                                case 5:
                                  return 'May';
                                case 6:
                                  return 'June';
                                case 7:
                                  return 'July';
                                case 8:
                                  return 'August';
                                case 9:
                                  return 'September';
                                case 10:
                                  return 'October';
                                case 11:
                                  return 'November';
                                case 12:
                                  return 'December';
                                default:
                                  return 'January';
                              }
                            }

                            String text = '';
                            DateTime currentDate = DateTime.now();
                            if (currentDate.difference(groupByValue).inDays ==
                                0) {
                              text = 'Today';
                            } else if (currentDate
                                    .difference(groupByValue)
                                    .inDays ==
                                1) {
                              text = 'Yesterday';
                            } else {
                              text =
                                  '${groupByValue.day} ${getMonth()} ${groupByValue.year}';
                            }
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 0,
                              ),
                              child: Text(
                                text,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: isLight
                                      ? ColorConstant.black
                                      : ColorConstant.whiteA700,
                                ),
                              ),
                            );
                          },
                          itemBuilder: (context, book) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .push(
                                    AppRoutesPath.bookDetail,
                                    extra: book.bookId!,
                                  )
                                      .then((value) {
                                    context
                                        .read<ViewAllBookProvider>()
                                        .getViewAllBooks(
                                          param: widget.param,
                                          key: widget.jsonKey,
                                        );
                                    if (widget.param == 'favorites') {
                                      setState(() {});
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: AppDecoration.fill4.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder8,
                                    color:
                                        isLight ? ColorConstant.kF3F3F3 : null,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      book.name ?? 'Book Name',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: theme
                                                          .textTheme.titleSmall!
                                                          .copyWith(
                                                        color: isLight
                                                            ? ColorConstant
                                                                .black
                                                            : null,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                  book.freeBook! == 0 &&
                                                          !AppStorage
                                                              .getPurchased()
                                                      ? Padding(
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
                                                        )
                                                      : const SizedBox.shrink(),
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
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          right: 20.0,
                                                        ),
                                                        child: Text(
                                                          '${book.description}',
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
