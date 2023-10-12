import 'dart:ui';

import 'package:book/model/book_chapter_model.dart';
import 'package:book/presentation/book_read_screen/book_read_screen.dart';
import 'package:book/presentation/detail_page_container_page/widgets/chipviewframefo2_item_widget.dart';
import 'package:book/presentation/payment_screen/payment_screen.dart';
import 'package:book/provider/detail_provider.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:book/widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_export.dart';
import '../../core/utils/color_constant.dart';
import '../../widgets/custom_icon_button.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Consumer<DetailProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? Center(
                    child: CircularProgressIndicator(color: appTheme.teal400),
                  )
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height / 2.3,
                          width: width,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                url: provider.detailModel.book!.frontCover,
                                height: height / 2.3,
                                width: width,
                                fit: BoxFit.fill,
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
                                            theme.colorScheme.onPrimaryContainer
                                                .withOpacity(0.3),
                                            theme.colorScheme.onPrimaryContainer
                                                .withOpacity(0.7),
                                            theme.colorScheme.onPrimaryContainer
                                                .withOpacity(1),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                      left: 20,
                                      top: 20,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: appTheme.teal400
                                                .withOpacity(0.5),
                                          ),
                                          height: 45,
                                          width: 45,
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.arrow_back_ios_new,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 35,
                                          width: 35,
                                          child: Center(
                                            child: Consumer<WishlistProvider>(
                                              builder: (
                                                context,
                                                wishlistProvider,
                                                child,
                                              ) {
                                                bool isFavorite =
                                                    wishlistProvider.bookId
                                                        .contains(
                                                  provider.detailModel.book
                                                          ?.bookId ??
                                                      0,
                                                );
                                                return IconButton(
                                                  onPressed: () {
                                                    if (isFavorite) {
                                                      context
                                                          .read<
                                                              WishlistProvider>()
                                                          .addRemoveBookInWishlist(
                                                            provider.detailModel
                                                                .book!,
                                                            0,
                                                          );
                                                    } else {
                                                      context
                                                          .read<
                                                              WishlistProvider>()
                                                          .addRemoveBookInWishlist(
                                                            provider.detailModel
                                                                .book!,
                                                            1,
                                                          );
                                                    }
                                                  },
                                                  icon: isFavorite
                                                      ? const Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                        )
                                                      : const Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.red,
                                                        ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22),
                                    child: SizedBox(
                                      height: height / 4,
                                      width: width / 2.3,
                                      child: CustomImageView(
                                        url: provider
                                            .detailModel.book!.frontCover,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        int isFree = provider
                                            .detailModel.book!.freeBook!;
                                        if (isFree == 1) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BookReadScreen(
                                                bookId: widget.bookId,
                                              ),
                                            ),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const PaymentScreen(),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        height: 60,
                                        width: width,
                                        decoration: AppDecoration.fill.copyWith(
                                          color: ColorConstant.primaryColor,
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomImageView(
                                              imagePath: ImageConstant.readBook,
                                              height: 24,
                                              width: 24,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'Read Book',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.titleSmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            top: 25,
                            right: 16,
                          ),
                          child: SizedBox(
                            width: width,
                            child: Text(
                              '${provider.detailModel.book!.title}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: isLight ? ColorConstant.black : null,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 8),
                            child: Builder(
                              builder: (context) {
                                String author = '';
                                List<dynamic> list = (provider.detailModel.book!
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
                                  style: theme.textTheme.titleSmall!.copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            top: 16,
                            right: 16,
                          ),
                          child: Container(
                            height: 43,
                            padding: const EdgeInsets.only(
                              left: 40,
                              top: 7,
                              right: 40,
                              bottom: 7,
                            ),
                            decoration: AppDecoration.fill.copyWith(
                              color: ColorConstant.primaryColor,
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (provider.detailModel.book
                                        ?.originalPrintLength !=
                                    null) ...[
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        CustomImageView(
                                          imagePath: ImageConstant.clock,
                                          height: 20,
                                          width: 20,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 9,
                                            top: 1,
                                            bottom: 1,
                                          ),
                                          child: Text(
                                            '${provider.detailModel.book?.originalPrintLength} min',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.titleSmall,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    color: const Color.fromARGB(
                                      162,
                                      255,
                                      255,
                                      255,
                                    ),
                                  ),
                                ],
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      CustomImageView(
                                        imagePath: ImageConstant.ideas,
                                        height: 20,
                                        width: 20,
                                      ),
                                      Padding(
                                        padding: getPadding(left: 9, top: 2),
                                        child: Text(
                                          '${provider.detailModel.bookChapter.length} Key Concepts',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: theme.textTheme.titleSmall,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 31),
                            child: Text(
                              'About this Book',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleMediumWhiteA700
                                  .copyWith(
                                color: isLight ? ColorConstant.black : null,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            top: 7,
                            right: 16,
                          ),
                          child: SizedBox(
                            width: width,
                            child: Text(
                              '${provider.detailModel.book!.description}',
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodyMediumThin.copyWith(
                                color: isLight ? ColorConstant.black : null,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Builder(
                            builder: (context) {
                              List<String> categories = [];
                              for (var element in ((provider
                                      .detailModel.book!.categoryName ??
                                  []) as List<dynamic>)) {
                                categories.add(element);
                              }
                              for (var element in ((provider
                                      .detailModel.book!.subcategoryName ??
                                  []) as List<dynamic>)) {
                                categories.add(element);
                              }
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 13),
                                child: Wrap(
                                  runSpacing: getVerticalSize(5),
                                  spacing: getHorizontalSize(5),
                                  children: List<Widget>.generate(
                                    categories.length,
                                    (index) => Chipviewframefo2ItemWidget(
                                      text: categories[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 27),
                            child: Text(
                              '${provider.detailModel.bookChapter.length} Key Concepts',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: isLight ? ColorConstant.black : null,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            top: 20,
                            right: 16,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '  ',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.titleMediumWhiteA700
                                    .copyWith(
                                  color: isLight ? ColorConstant.black : null,
                                ),
                              ),
                              const SizedBox(width: 25),
                              Expanded(
                                child: Text(
                                  'Introduction',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.titleMediumWhiteA700
                                      .copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              CustomIconButton(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: isLight
                                      ? Colors.transparent
                                      : ColorConstant.whiteA700,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(5),
                                child: CustomImageView(
                                  color: ColorConstant.primaryColor,
                                  imagePath: ImageConstant.inReed,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            top: 20,
                            right: 16,
                          ),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: getVerticalSize(24));
                            },
                            itemCount: provider.detailModel.bookChapter.length,
                            itemBuilder: (context, index) {
                              BookChapterModel chapter =
                                  provider.detailModel.bookChapter[index];
                              return Row(
                                children: [
                                  Text(
                                    '0${index + 1}',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.titleMediumWhiteA700
                                        .copyWith(
                                      color:
                                          isLight ? ColorConstant.black : null,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      '${chapter.title}',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .titleMediumWhiteA700
                                          .copyWith(
                                        color: isLight
                                            ? ColorConstant.black
                                            : null,
                                        fontSize: 18,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  CustomIconButton(
                                    height: 32,
                                    width: 32,
                                    child: CustomImageView(
                                      height: 25,
                                      width: 25,
                                      imagePath: ImageConstant.imgUillock1,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            top: 20,
                            right: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '  ',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.titleMediumWhiteA700
                                    .copyWith(
                                  color: isLight ? ColorConstant.black : null,
                                ),
                              ),
                              const SizedBox(width: 25),
                              Expanded(
                                child: Text(
                                  'Final Summary',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStyles.titleMediumBold.copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              CustomIconButton(
                                height: 32,
                                width: 32,
                                child: CustomImageView(
                                  height: 25,
                                  width: 25,
                                  imagePath: ImageConstant.imgUillock1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 31),
                            child: Text(
                              'About the Author',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleMediumWhiteA700
                                  .copyWith(
                                color: isLight ? ColorConstant.black : null,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            top: 7,
                            right: 16,
                          ),
                          child: SizedBox(
                            width: width,
                            child: Text(
                              '${provider.detailModel.authors[0].description}',
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodyMediumThin.copyWith(
                                color: isLight ? ColorConstant.black : null,
                              ),
                            ),
                          ),
                        ),
                        provider.detailModel.similarBook.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  top: 25,
                                  right: 16,
                                ),
                                child: Text(
                                  'Similar Books',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      theme.textTheme.headlineSmall!.copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        provider.detailModel.similarBook.isNotEmpty
                            ? Padding(
                                padding: getPadding(
                                  top: 20,
                                  bottom: 20,
                                  left: 16,
                                  right: 16,
                                ),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      provider.detailModel.similarBook.length,
                                      (index) => BookTile(
                                        book: provider
                                            .detailModel.similarBook[index],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
