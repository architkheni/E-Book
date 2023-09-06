import 'package:book/model/book_model.dart';
import 'package:book/model/category_model.dart';
import 'package:book/provider/explore_provider.dart';
import 'package:book/provider/home_provider.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_text_form_field.dart';
import '../explore_page/widgets/explore_item_widget.dart';
import '../home_recommended_for_you_see_all_screen/home_recommended_for_you_see_all_screen.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  TextEditingController searchController = TextEditingController();

  var selectCategory;
  var selectSubCategory;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray90003,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.black,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: getPadding(top: 24),
            child: Padding(
              padding: getPadding(left: 15, bottom: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (selectCategory != null)
                        Container(
                          child: AppbarImage(
                            height: 20,
                            width: 15,
                            svgPath: ImageConstant.imgArrowleftBlueGray50,
                            margin: getMargin(right: 16),
                            onTap: () {
                              setState(() {
                                selectCategory = null;
                                searchController.clear();
                                selectSubCategory = null;
                              });
                            },
                          ),
                        ),
                      CustomImageView(
                        imagePath: ImageConstant.exploreImage,
                        height: 35,
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    controller: searchController,
                    margin: getMargin(left: 1, top: 23, right: 16),
                    contentPadding: getPadding(top: 14, right: 30, bottom: 14),
                    textStyle: CustomTextStyles.bodyMediumWhite500,
                    hintText: "Title, author or keyword",
                    hintStyle: CustomTextStyles.bodyMediumWhite500,
                    prefix: Container(
                        margin:
                            getMargin(left: 16, top: 14, right: 10, bottom: 14),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgSearch)),
                    prefixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(45)),
                    filled: true,
                    autofocus: false,
                    fillColor: appTheme.blueGray900,
                    onChanged: (value) {
                      setState(() {
                        selectCategory = value.toLowerCase();
                      });
                    },
                  ),
                  if (selectSubCategory == null) ...{
                    Padding(
                        padding: getPadding(top: 42),
                        child: Text(
                            selectCategory != null
                                ? "Sub-Category"
                                : "Categories",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleLarge)),
                  } else ...{
                    Padding(
                        padding: getPadding(top: 10),
                        child: Text("Search Results",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleMedium)),
                  },
                  SizedBox(height: 10),
                  if (selectSubCategory == null) ...{
                    if (selectCategory == null) ...{
                      Consumer<ExploreProvider>(
                        builder: (context, provider, child) {
                          List<CategoryModel> categories = provider.categories;
                          return Wrap(
                            runSpacing: getVerticalSize(5),
                            spacing: getHorizontalSize(5),
                            children: List<Widget>.generate(
                                categories.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            searchController.text =
                                                categories[index].name ??
                                                    "Personal growth";
                                            selectCategory = index;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: appTheme.blueGray900,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              categories[index].name ??
                                                  "Personal growth",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: appTheme.blueGray50,
                                                fontSize: getFontSize(
                                                  12,
                                                ),
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w100,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                          );
                        },
                      ),
                    } else ...{
                      Consumer<ExploreProvider>(
                        builder: (context, provider, child) {
                          List<CategoryModel> subCategories =
                              provider.subCategories;
                          return Wrap(
                            runSpacing: getVerticalSize(5),
                            spacing: getHorizontalSize(5),
                            children: List<Widget>.generate(
                                subCategories.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            searchController.text =
                                                subCategories[index].name!;
                                            selectSubCategory = index;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: appTheme.blueGray900,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              subCategories[index].name!,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: appTheme.blueGray50,
                                                fontSize: getFontSize(
                                                  12,
                                                ),
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w100,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                          );
                        },
                      ),
                    },
                  } else ...{
                    ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: AppDecoration.fill4.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: CustomImageView(
                                  imagePath:
                                      ImageConstant.imgE50c016fb6a84106x74,
                                  height: _height / 10,
                                  width: _width / 6,
                                  fit: BoxFit.fill,
                                  radius: BorderRadius.circular(5),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, top: 1, bottom: 4),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "The Marketing Age",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.titleSmall,
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        "Mark mcallister",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.labelLarge,
                                      ),
                                      SizedBox(height: 7),
                                      Row(
                                        children: [
                                          Icon(Icons.headphones,
                                              color: appTheme.whiteA700,
                                              size: 20),
                                          SizedBox(width: 5),
                                          Text(
                                            "8m",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.labelLarge,
                                          ),
                                          SizedBox(width: 10),
                                          Icon(Icons.visibility_outlined,
                                              color: appTheme.whiteA700,
                                              size: 20),
                                          SizedBox(width: 5),
                                          Text(
                                            "8m",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.labelLarge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  },

                  /* SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: getPadding(top: 13),
                    child: IntrinsicWidth(
                      child: Wrap(
                        runSpacing: getVerticalSize(5),
                        spacing: getHorizontalSize(5),
                        children: List<Widget>.generate(
                            11, (index) => ChipviewframefoItemWidget()),
                      ),
                    ),
                  ),*/
                  Consumer<HomePovider>(builder: (context, provider, child) {
                    return provider.dashboardModel.recentlyAddBook.isNotEmpty
                        ? Padding(
                            padding: getPadding(left: 1, top: 45),
                            child: Row(children: [
                              Text("Recently Added",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.headlineSmall),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeRecommendedForYouSeeAllScreen(
                                              title: "Recently Added",
                                              books: [],
                                            )),
                                  );
                                },
                                child: Padding(
                                    padding: getPadding(top: 7, bottom: 7),
                                    child: Text("Show all",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles
                                            .labelLargeTeal400)),
                              ),
                              CustomImageView(
                                  svgPath: ImageConstant.imgArrowright,
                                  height: getSize(16),
                                  width: getSize(16),
                                  margin: getMargin(left: 4, top: 7, bottom: 7))
                            ]))
                        : SizedBox.shrink();
                  }),
                  Consumer<HomePovider>(builder: (context, provider, child) {
                    return provider.dashboardModel.recentlyAddBook.isNotEmpty
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                                height: getVerticalSize(287),
                                child: ListView.separated(
                                    padding: getPadding(left: 1, top: 31),
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                          width: getHorizontalSize(13));
                                    },
                                    itemCount: provider
                                        .dashboardModel.recentlyAddBook.length,
                                    itemBuilder: (context, index) {
                                      BookModel book = provider.dashboardModel
                                          .recentlyAddBook[index];
                                      return ExploreItemWidget(
                                          book: book,
                                          onTapStackellipse394: () {
                                            // onTapStackellipse394(context);
                                          });
                                    })))
                        : SizedBox.shrink();
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
