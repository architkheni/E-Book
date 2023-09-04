import 'package:book/model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

// ignore: must_be_immutable
class ExploreItemWidget extends StatelessWidget {
  final BookModel? book;
  ExploreItemWidget({
    Key? key,
    this.onTapStackellipse394,
    this.book,
  }) : super(
          key: key,
        );

  VoidCallback? onTapStackellipse394;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: _width / 2.1,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: _width / 2.2,
          // color: Colors.green[500],
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 19),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            book?.name ?? "The Good Guy",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleSmall,
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 18,
                              width: 15,
                              child: CustomImageView(
                                imagePath: ImageConstant.lock,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        book?.authorName ?? "A Fanklin",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        book?.categoryName ?? "Banish Forgutable Forever",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodySmall,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Container(
                              height: 15,
                              width: 40,
                              decoration: BoxDecoration(
                                color: appTheme.teal400,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Blinks",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 4, top: 1, bottom: 1),
                              child: Text(
                                "21 min",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        // color: Colors.pink,
                        height: _height / 5.3,
                        width: _width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 70),
                              child: CustomImageView(
                                imagePath: ImageConstant.bookBackImage,
                                height: _height / 5.3,
                                width: _width,
                                fit: BoxFit.fill,
                                // alignment: Alignment.center,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                // color: Colors.black,
                                height: _height / 5.3,
                                width: _width / 3.3,
                                child: CustomImageView(
                                  imagePath:
                                      ImageConstant.imgE50c016fb6a84145x100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  // color: Colors.lightGreen,
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: CustomImageView(
                                      imagePath: ImageConstant.likeIcon,
                                      fit: BoxFit.fill,
                                      height: 20,
                                      width: 20,
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
        ),
      ),
    );
  }
}
