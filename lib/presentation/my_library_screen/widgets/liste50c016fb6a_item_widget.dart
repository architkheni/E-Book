// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/book_model.dart';
import 'package:book/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Liste50c016fb6aItemWidget extends StatelessWidget {
  final BookModel book;
  const Liste50c016fb6aItemWidget({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        context.push(
          AppRoutesPath.bookDetail,
          extra: book.bookId!,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            book.name ?? 'Book Name',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: isLight ? ColorConstant.black : null,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        book.freeBook! == 0
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                  bottom: 7,
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgLockTeal400,
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
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              children: [
                                const Spacer(),
                                Row(
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgGgread,
                                      height: 16,
                                      width: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 4,
                                        top: 1,
                                        bottom: 1,
                                      ),
                                      child: Text(
                                        '${book.originalAudiobookLength ?? 0}m',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles.bodySmallTeal400
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
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 20.0,
                              ),
                              child: Text(
                                '${book.description}',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    CustomTextStyles.bodySmallThin_1.copyWith(
                                  color: isLight ? ColorConstant.black : null,
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
    );
  }
}
