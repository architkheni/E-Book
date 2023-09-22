import 'package:book/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListoneItemWidget extends StatelessWidget {
  const ListoneItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width / 2.7,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: width / 2.7,
          height: height / 4,
          padding: getPadding(
            left: 8,
            right: 8,
          ),
          decoration: AppDecoration.fill1.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomImageView(
                svgPath: ImageConstant.img,
                height: 30,
                width: 30,
              ),
              Padding(
                padding: getPadding(
                  left: 12,
                  top: 16,
                ),
                child: Text(
                  'Demo Text iusdhub  db sahd  sabdhs db sahd sa ds ad sadisdhshad bs dh shdb hs dasd sahbasdbas dsa dsad sadsad sd f jh  ',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.labelMedium,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 30,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgE50c016fb6a8454x37,
                      height: 70,
                      width: 50,
                    ),
                    const Spacer(),
                    CustomImageView(
                      svgPath: ImageConstant.img,
                      height: 20,
                      width: 25,
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
