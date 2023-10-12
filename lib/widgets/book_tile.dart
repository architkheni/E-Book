import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/core/utils/string_utils.dart';
import 'package:book/model/book_model.dart';
import 'package:book/presentation/detail_page_container_page/detail_page_container_page.dart';
import 'package:book/provider/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BookTile extends StatelessWidget {
  final BookModel book;
  const BookTile({Key? key, required this.book})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPageContainerPage(
                bookId: book.bookId!,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: SizedBox(
          width: width / 2.1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: height / 5,
                          width: width / 3.3,
                          child: CustomImageView(
                            url: book.frontCover,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: -5,
                      child: Consumer<WishlistProvider>(
                        builder: (context, wishlistProvider, child) {
                          bool isFavorite =
                              wishlistProvider.bookId.contains(book.bookId!);

                          return IconButton(
                            onPressed: () {
                              if (isFavorite) {
                                context
                                    .read<WishlistProvider>()
                                    .addRemoveBookInWishlist(book, 0);
                              } else {
                                context
                                    .read<WishlistProvider>()
                                    .addRemoveBookInWishlist(book, 1);
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
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      book.title ?? 'The Good Guy',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: isLight ? ColorConstant.black : null,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  book.freeBook! == 0
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            height: 18,
                            width: 15,
                            child: CustomImageView(
                              imagePath: ImageConstant.lock,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                book.authorName ?? 'No author',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: isLight ? ColorConstant.black : null,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                book.description ?? 'Banish Forgutable Forever',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                maxLines: 2,
                style: theme.textTheme.bodySmall!.copyWith(
                  color: isLight ? ColorConstant.black : null,
                  fontSize: 13,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
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
                          book.type?.capitlize ?? 'Blinks',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: isLight ? ColorConstant.black : null,
                          ),
                        ),
                      ),
                    ),
                    book.originalAudiobookLength != null
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 4,
                              top: 1,
                              bottom: 1,
                            ),
                            child: Text(
                              '${book.originalAudiobookLength} min',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.bodySmall!.copyWith(
                                color: isLight ? ColorConstant.black : null,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
