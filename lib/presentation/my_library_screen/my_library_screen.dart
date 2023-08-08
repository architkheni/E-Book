import '../home_recommended_for_you_see_all_screen/home_recommended_for_you_see_all_screen.dart';
import '../my_library_screen/widgets/liste50c016fb6a_item_widget.dart';
import '../my_library_screen/widgets/listrectanglesi_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:book/core/app_export.dart';

class MyLibraryScreen extends StatelessWidget {
  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray90003,
            body: SizedBox(
                width: double.maxFinite,
                child: Padding(
                    padding: getPadding(top: 25),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(left: 16),
                                  child: Text("My Library",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: theme.textTheme.headlineSmall))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                  width: getHorizontalSize(136),
                                  child: Divider(
                                      height: getVerticalSize(2),
                                      thickness: getVerticalSize(2),
                                      color: appTheme.teal400,
                                      indent: getHorizontalSize(16)))),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeRecommendedForYouSeeAllScreen(Title: "Favourite",)),
                                );
                                // onTapRowfavorite(context);
                              },
                              child: Padding(
                                  padding: getPadding(left: 16, top: 21),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 36,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: CustomImageView(
                                                imagePath:
                                                    ImageConstant.SaveAllBook,
                                                alignment: Alignment.center),
                                          ),
                                        ),
                                        Padding(
                                            padding: getPadding(
                                                left: 15, top: 10, bottom: 8),
                                            child: Text("Favourite",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .titleSmallWhiteA700)),
                                        Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowright,
                                              height: getSize(16),
                                              width: getSize(16),
                                              margin: getMargin(
                                                  left: 4, top: 2, bottom: 7)),
                                        ),
                                      ]))),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeRecommendedForYouSeeAllScreen(Title: "In Progress",)),
                                );
                              },
                              child: Padding(
                                  padding: getPadding(left: 16, top: 9),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 36,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            // color: Colors.red,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: CustomImageView(
                                                imagePath: ImageConstant.inReed,
                                                alignment: Alignment.center),
                                          ),
                                        ),
                                        Padding(
                                            padding: getPadding(
                                                left: 14, top: 11, bottom: 8),
                                            child: Text("In Progress",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .titleSmallMedium)),
                                        Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowright,
                                              height: getSize(16),
                                              width: getSize(16),
                                              margin: getMargin(
                                                  left: 4, top: 2, bottom: 7)),
                                        )
                                      ]))),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeRecommendedForYouSeeAllScreen(Title: "Finished",)),
                              );
                            },
                            child: Padding(
                                padding: getPadding(left: 16, top: 9),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 36,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.BookFinish,
                                              alignment: Alignment.center),
                                        ),
                                      ),
                                      Padding(
                                          padding: getPadding(
                                              left: 14, top: 10, bottom: 9),
                                          child: Text("Finished",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .titleSmallMedium)),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgArrowright,
                                            height: getSize(16),
                                            width: getSize(16),
                                            margin: getMargin(
                                                left: 4, top: 2, bottom: 7)),
                                      )
                                    ])),
                          ),
                          Padding(
                              padding: getPadding(left: 16, top: 25),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("My History",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.titleLarge),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeRecommendedForYouSeeAllScreen(Title: "My History",)),
                                        );
                                      },
                                      child: Padding(
                                          padding:
                                              getPadding(top: 2, bottom: 7),
                                          child: Text("Show all",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .labelLargeTeal400)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgArrowright,
                                          height: getSize(16),
                                          width: getSize(16),
                                          margin: getMargin(
                                              left: 4, top: 2, bottom: 7)),
                                    )
                                  ])),
                          Expanded(
                              child: Container(
                                  height: getVerticalSize(648),
                                  width: double.maxFinite,
                                  margin: getMargin(top: 9),
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 17, right: 20),
                                                child: ListView.separated(
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return SizedBox(
                                                          height:
                                                              getVerticalSize(
                                                                  12));
                                                    },
                                                    itemCount: 13,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Liste50c016fb6aItemWidget();
                                                    }))),
                                      ])))
                        ])))));
  }
}
