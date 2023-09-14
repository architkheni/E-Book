import 'dart:developer';

import 'package:book/model/book_chapter_mode.dart';
import 'package:book/model/book_model.dart';
import 'package:book/presentation/home/widgets/listtitle1_item_widget.dart';
import 'package:book/provider/detail_provider.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_export.dart';
import '../../core/utils/color_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../book_read_screen/book_read_screen.dart';
import '../detail_page_container_page/widgets/chipviewframefo2_item_widget.dart';
import '../home_recommended_for_you_see_all_screen/home_recommended_for_you_see_all_screen.dart';

class DetailPageContainerPage extends StatelessWidget {
  final int bookId;
  const DetailPageContainerPage({Key? key, required this.bookId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailProvider(),
      child: DetailView(bookId),
    );
  }
}

class DetailView extends StatefulWidget {
  final int bookId;
  const DetailView(this.bookId, {Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  void initState() {
    super.initState();
    context.read<DetailProvider>().getBookDetails(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray90003,
            body: Consumer<DetailProvider>(builder: (context, provider, child) {
              return provider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: appTheme.teal400),
                    )
                  : Container(
                      width: _width,
                      height: _height,
                      decoration: AppDecoration.black,
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    color: Colors.pink,
                                    height: _height / 2.8,
                                    width: _width,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CustomImageView(
                                          // imagePath:
                                          //     ImageConstant.imgE50c016fb6a84,
                                          url: provider
                                              .detailModel.book!.frontCover,
                                          height: _height / 2.8,
                                          width: _width,
                                          fit: BoxFit.fill,
                                        ),
                                        Align(
                                            child: Container(
                                                width: _width,
                                                decoration: AppDecoration
                                                    .gradientnamegray90003opacity0namegray90003,
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 20),
                                                          child: Container(
                                                            height: 35,
                                                            width: 35,
                                                            // color: Colors.red,
                                                            child: Center(
                                                              child: Consumer<
                                                                      WishlistProvider>(
                                                                  builder: (context,
                                                                      wishlistProvider,
                                                                      child) {
                                                                bool isFavorite = wishlistProvider
                                                                    .bookId
                                                                    .contains(provider
                                                                        .detailModel
                                                                        .book!
                                                                        .bookId!);
                                                                log(isFavorite
                                                                    .toString());
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    if (isFavorite) {
                                                                      context.read<WishlistProvider>().addRemoveBookInWishlist(
                                                                          provider
                                                                              .detailModel
                                                                              .book!,
                                                                          0);
                                                                    } else {
                                                                      context.read<WishlistProvider>().addRemoveBookInWishlist(
                                                                          provider
                                                                              .detailModel
                                                                              .book!,
                                                                          1);
                                                                    }
                                                                  },
                                                                  child:
                                                                      CustomImageView(
                                                                    imagePath: isFavorite
                                                                        ? ImageConstant
                                                                            .likeIcon
                                                                        : ImageConstant
                                                                            .like,
                                                                    height: 20,
                                                                    width: 20,
                                                                  ),
                                                                );
                                                              }),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 22),
                                                        child: Container(
                                                          // color: Colors.amber,
                                                          height: _height / 5,
                                                          width: _width / 2.7,
                                                          child:
                                                              CustomImageView(
                                                            // imagePath: ImageConstant
                                                            //     .imgE50c016fb6a84,
                                                            url: provider
                                                                .detailModel
                                                                .book!
                                                                .frontCover,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 16,
                                                                right: 16),
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            BookReadScreen()),
                                                              );
                                                            },
                                                            child: Container(
                                                                height: 60,
                                                                width: _width,
                                                                decoration: AppDecoration.fill.copyWith(
                                                                    color: ColorConstant
                                                                        .primaryColor,
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder10),
                                                                child: Row(
                                                                    children: [
                                                                      Spacer(),
                                                                      CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant.readBook,
                                                                        height:
                                                                            24,
                                                                        width:
                                                                            24,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            8,
                                                                      ),
                                                                      Text(
                                                                          "Read Book",
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          textAlign: TextAlign
                                                                              .left,
                                                                          style: theme
                                                                              .textTheme
                                                                              .titleSmall),
                                                                      Spacer(),
                                                                    ]))),
                                                      )
                                                    ])))
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 25, right: 16),
                                  child: Container(
                                      width: _width,
                                      child: Text(
                                        "${provider.detailModel.book!.title}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.titleLarge,
                                      )),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 8),
                                      child: Text(
                                          "${provider.detailModel.book!.description}",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.titleSmall),
                                    )),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, top: 8),
                                        child: Text(
                                            "${provider.detailModel.book!.categoryName}",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .bodyMediumThin))),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, top: 16, right: 16),
                                  child: Container(
                                    height: 43,
                                    padding: EdgeInsets.only(
                                        left: 40, top: 7, right: 40, bottom: 7),
                                    decoration: AppDecoration.fill.copyWith(
                                        color: ColorConstant.primaryColor,
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Spacer(),
                                                CustomImageView(
                                                  imagePath:
                                                      ImageConstant.clock,
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                Padding(
                                                    padding: getPadding(
                                                        left: 9,
                                                        top: 1,
                                                        bottom: 1),
                                                    child: Text("18 min ",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: theme.textTheme
                                                            .titleSmall)),
                                                Spacer(),
                                              ],
                                            )),
                                        Container(
                                          width: 1,
                                          color: Color.fromARGB(
                                              162, 255, 255, 255),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Spacer(),
                                                CustomImageView(
                                                  imagePath:
                                                      ImageConstant.ideas,
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                Padding(
                                                    padding: getPadding(
                                                        left: 9, top: 2),
                                                    child: Text("7 key ideas",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: theme.textTheme
                                                            .titleSmall)),
                                                Spacer(),
                                              ],
                                            )),
                                      ],
                                    ), /* Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Spacer(),
                                      CustomImageView(
                                        imagePath: ImageConstant.Clock,
                                        height: 20,
                                        width: 20,
                                      ),
                                      Padding(
                                          padding: getPadding(
                                              left: 9, top: 1, bottom: 1),
                                          child: Text("18 min ",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.titleSmall)),
                                      Spacer(),
                                      // SizedBox(
                                      //     height: getVerticalSize(20),
                                      //     child: VerticalDivider(
                                      //         width: getHorizontalSize(1),
                                      //         thickness: getVerticalSize(1),
                                      //         color: appTheme.gray400
                                      //             .withOpacity(0.46))),
                                      CustomImageView(
                                          imagePath: ImageConstant.Ideas,
                                          height: 20,
                                          width: 20,
                                          ),
                                      Padding(
                                          padding: getPadding(left: 9, top: 2),
                                          child: Text("7 key ideas",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.titleSmall)),
                                              Spacer(),
                                    ]) */
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 31),
                                      child: Text("About this Book",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .titleMediumWhiteA700),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 7, right: 16),
                                  child: Container(
                                      width: _width,
                                      child: Text(
                                          "${provider.detailModel.book!.description}",
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              CustomTextStyles.bodyMediumThin)),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding:
                                            EdgeInsets.only(left: 16, top: 13),
                                        child: Wrap(
                                            runSpacing: getVerticalSize(5),
                                            spacing: getHorizontalSize(5),
                                            children: List<Widget>.generate(
                                                5,
                                                (index) =>
                                                    Chipviewframefo2ItemWidget(
                                                      text: "Demo Text",
                                                    ))))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 27),
                                      child: Text(
                                          "${provider.detailModel.bookChapter.length} Chapters",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.titleLarge),
                                    )),
                                // GestureDetector(
                                //     onTap: () {
                                //       // onTapRowone(context);
                                //     },
                                //     child: Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: 16, top: 20),
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.center,
                                //         children: [
                                //           Padding(
                                //             padding: const EdgeInsets.only(
                                //                 bottom: 20),
                                //             child: Text(
                                //               "01",
                                //               overflow: TextOverflow.ellipsis,
                                //               textAlign: TextAlign.left,
                                //               style: CustomTextStyles
                                //                   .titleMediumWhiteA700,
                                //             ),
                                //           ),
                                //           Expanded(
                                //             child: Padding(
                                //               padding: const EdgeInsets.only(
                                //                 left: 16,
                                //               ),
                                //               child: Column(
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment.start,
                                //                 children: [
                                //                   Align(
                                //                     alignment:
                                //                         Alignment.centerLeft,
                                //                     child: Text("Chapter ",
                                //                         overflow: TextOverflow
                                //                             .ellipsis,
                                //                         textAlign:
                                //                             TextAlign.left,
                                //                         style: CustomTextStyles
                                //                             .titleMediumWhiteA700),
                                //                   ),
                                //                   Align(
                                //                     alignment:
                                //                         Alignment.centerLeft,
                                //                     child: Text(
                                //                       "Subscribe to unlock all 2 key ideas from book book book",
                                //                       overflow:
                                //                           TextOverflow.ellipsis,
                                //                       textAlign: TextAlign.left,
                                //                       style: CustomTextStyles
                                //                           .bodyMediumThin,
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //             ),
                                //           ),
                                //           Padding(
                                //             padding: const EdgeInsets.only(
                                //                 right: 16),
                                //             child: CustomIconButton(
                                //               height: 32,
                                //               width: 32,
                                //               child: CustomImageView(
                                //                 height: 25,
                                //                 width: 25,
                                //                 imagePath:
                                //                     ImageConstant.imgUillock1,
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 20, right: 16),
                                  child: ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(24));
                                      },
                                      itemCount: provider
                                          .detailModel.bookChapter.length,
                                      itemBuilder: (context, index) {
                                        BookChapterModel chapter = provider
                                            .detailModel.bookChapter[index];
                                        return /* ListtypeItemWidget(); */
                                            Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20),
                                              child: Text(
                                                "0$index",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .titleMediumWhiteA700,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          "Chapter ${index + 1}",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: CustomTextStyles
                                                              .titleMediumWhiteA700),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${chapter.title}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: CustomTextStyles
                                                            .bodyMediumThin,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            CustomIconButton(
                                              height: 32,
                                              width: 32,
                                              child: CustomImageView(
                                                height: 25,
                                                width: 25,
                                                imagePath:
                                                    ImageConstant.imgUillock1,
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, top: 24),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 6, bottom: 6, left: 0),
                                              child: Text("Final Summary",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles
                                                      .titleMediumBold)),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16),
                                            child: CustomIconButton(
                                                height: 32,
                                                width: 32,
                                                child: CustomImageView(
                                                    height: 25,
                                                    width: 25,
                                                    imagePath: ImageConstant
                                                        .imgUillock1)),
                                          )
                                        ])),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 31),
                                      child: Text("About the Author",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .titleMediumWhiteA700),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 7, right: 16),
                                  child: Container(
                                      width: _width,
                                      child: Text(
                                          "${provider.detailModel.authors[0].description}",
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              CustomTextStyles.bodyMediumThin)),
                                ),
                                provider.detailModel.recommendedBook.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, top: 25, right: 16),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Similar Books",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.headlineSmall),
                                              CustomElevatedButton(
                                                  width: 66,
                                                  height: 16,
                                                  text: "Show all",
                                                  margin: getMargin(
                                                      top: 7, bottom: 7),
                                                  rightIcon: Container(
                                                      margin:
                                                          getMargin(left: 4),
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgArrowright)),
                                                  buttonStyle:
                                                      CustomButtonStyles.none,
                                                  buttonTextStyle:
                                                      CustomTextStyles
                                                          .labelLargeTeal400,
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomeRecommendedForYouSeeAllScreen(
                                                                title:
                                                                    "Similar Books",
                                                                books: provider
                                                                    .detailModel
                                                                    .recommendedBook,
                                                              )),
                                                    );
                                                  })
                                            ]))
                                    : SizedBox.shrink(),
                                provider.detailModel.recommendedBook.isNotEmpty
                                    ? Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            height: _height / 2.9,
                                            child: ListView.separated(
                                                padding: getPadding(
                                                    left: 16, top: 32),
                                                physics:
                                                    BouncingScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(
                                                      width: getHorizontalSize(
                                                          13));
                                                },
                                                itemCount: provider.detailModel
                                                    .recommendedBook.length,
                                                itemBuilder: (context, index) {
                                                  BookModel book = provider
                                                      .detailModel
                                                      .recommendedBook[index];
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailPageContainerPage(
                                                                  bookId: book
                                                                      .bookId!,
                                                                )),
                                                      );
                                                    },
                                                    child: Listtitle1ItemWidget(
                                                      book: book,
                                                    ),
                                                  );
                                                })))
                                    : SizedBox.shrink()
                              ])));
            })));
  }
}
