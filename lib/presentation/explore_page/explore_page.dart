// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/category_model.dart';
import 'package:book/model/subcategory_model.dart';
import 'package:book/provider/category_provider.dart';
import 'package:book/provider/explore_provider.dart';
import 'package:book/provider/home_provider.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_text_form_field.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  TextEditingController searchController = TextEditingController();

  var selectCategory;
  var selectSubCategory;
  bool isTextStop = false;

  @override
  void initState() {
    searchController.addListener(() {
      if (searchController.text.trim().isEmpty) {
        setState(() {
          selectCategory = null;
          selectSubCategory = null;
          isTextStop = false;
        });
        return;
      }
      if (!isTextStop) {
        Future.delayed(const Duration(seconds: 2), () {
          if (searchController.text.trim().isNotEmpty) {
            context
                .read<ExploreProvider>()
                .searchBook(searchController.text.trim());
            setState(() {
              selectCategory = searchController.text.trim();
              selectSubCategory = searchController.text.trim();
            });
            isTextStop = false;
          }
        });
        isTextStop = true;
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<CategoryProvider>().addListener(() {
      int? id = context.read<CategoryProvider>().categoryId;
      String name = context.read<CategoryProvider>().categoryName;
      if (id != null) {
        context.read<ExploreProvider>().getSubCategories(id);
        selectCategory = name;
        setState(() {});
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    mediaQueryData = MediaQuery.of(context);
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                        AppbarImage(
                          height: 20,
                          width: 15,
                          color: isLight ? ColorConstant.black : null,
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
                      Container(
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
                          text: 'Search',
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    controller: searchController,
                    margin: getMargin(left: 1, top: 23, right: 16),
                    contentPadding: getPadding(top: 14, right: 30, bottom: 14),
                    textStyle: CustomTextStyles.bodyMediumWhite500.copyWith(
                      color: isLight ? ColorConstant.black : null,
                    ),
                    hintText: 'Title, author or keyword',
                    hintStyle: CustomTextStyles.bodyMediumWhite500.copyWith(
                      color: isLight ? ColorConstant.k626666 : null,
                    ),
                    prefix: Container(
                      margin:
                          getMargin(left: 16, top: 14, right: 10, bottom: 14),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgSearch,
                        color: isLight ? ColorConstant.black : null,
                      ),
                    ),
                    prefixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(20)),
                    filled: true,
                    autofocus: false,
                    fillColor:
                        isLight ? ColorConstant.kF3F3F3 : appTheme.blueGray900,
                    onChanged: (value) {},
                  ),
                  if (selectSubCategory == null) ...{
                    Padding(
                      padding: getPadding(top: 30),
                      child: Text(
                        selectCategory != null ? 'Sub-Category' : 'Categories',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: isLight ? ColorConstant.black : null,
                        ),
                      ),
                    ),
                  } else ...{
                    Padding(
                      padding: getPadding(top: 30),
                      child: Text(
                        'Search Results',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: isLight ? ColorConstant.black : null,
                        ),
                      ),
                    ),
                  },
                  const SizedBox(height: 10),
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
                                  horizontal: 5,
                                  vertical: 2,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      context
                                          .read<ExploreProvider>()
                                          .getSubCategories(
                                            categories[index].categoryId!,
                                          );
                                      selectCategory = index;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: isLight
                                          ? ColorConstant.kF3F3F3
                                          : appTheme.blueGray900,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomImageView(
                                          url: categories[index].icon,
                                          height: 12,
                                          width: 12,
                                          margin: getMargin(right: 5),
                                          color: isLight ? Colors.black : null,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0.0),
                                          child: Text(
                                            categories[index].name ??
                                                'Personal growth',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: isLight
                                                  ? ColorConstant.black
                                                  : appTheme.blueGray50,
                                              fontSize: getFontSize(
                                                12,
                                              ),
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    } else ...{
                      Consumer<ExploreProvider>(
                        builder: (context, provider, child) {
                          List<SubcategoryModel> subCategories =
                              provider.subCategories;
                          if (provider.isLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: ColorConstant.primaryColor,
                              ),
                            );
                          }
                          if (subCategories.isEmpty) {
                            return const Text(
                              'We don\'t currently have what you\'re looking for. Why not suggest it to us?',
                              textAlign: TextAlign.left,
                            );
                          }
                          return provider.isLoading
                              ? const SizedBox.shrink()
                              : Wrap(
                                  runSpacing: getVerticalSize(5),
                                  spacing: getHorizontalSize(5),
                                  children: List<Widget>.generate(
                                    subCategories.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 2,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<ExploreProvider>()
                                              .getSubcategoriesBooks(
                                                subCategories[index]
                                                    .subcategoryId!,
                                              );
                                          setState(() {
                                            selectSubCategory = index;
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: isLight
                                                ? ColorConstant.kF3F3F3
                                                : appTheme.blueGray900,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomImageView(
                                                url: subCategories[index].icon,
                                                height: 12,
                                                width: 12,
                                                margin: getMargin(right: 5),
                                                color: isLight
                                                    ? Colors.black
                                                    : null,
                                              ),
                                              Text(
                                                subCategories[index].name!,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: isLight
                                                      ? ColorConstant.black
                                                      : appTheme.blueGray50,
                                                  fontSize: getFontSize(
                                                    12,
                                                  ),
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ),
                    },
                  } else ...{
                    Consumer<ExploreProvider>(
                      builder: (
                        BuildContext context,
                        ExploreProvider provider,
                        Widget? child,
                      ) {
                        if (provider.isLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: ColorConstant.primaryColor,
                            ),
                          );
                        }
                        if (provider.books.isEmpty) {
                          return const Text(
                            'We don\'t currently have what you\'re looking for. Why not suggest it to us?',
                          );
                        }
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 10);
                          },
                          itemCount: provider.books.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.push(
                                  AppRoutesPath.bookDetail,
                                  extra: provider.books[index].bookId!,
                                );
                              },
                              child: Container(
                                decoration: AppDecoration.fill4.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8,
                                  color: isLight ? Colors.transparent : null,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: CustomImageView(
                                        url: provider.books[index].frontCover,
                                        height: width / 6 * 1.5,
                                        width: width / 6,
                                        fit: BoxFit.fill,
                                        radius: BorderRadius.circular(5),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 9),
                                            Text(
                                              provider.books[index].title ??
                                                  'Book title',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: theme.textTheme.titleSmall!
                                                  .copyWith(
                                                color: isLight
                                                    ? ColorConstant.black
                                                    : null,
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            Builder(
                                              builder: (context) {
                                                String author = '';
                                                if (provider
                                                        .books[index]
                                                        .authorName
                                                        .runtimeType ==
                                                    String) {
                                                  author = provider
                                                      .books[index].authorName;
                                                } else {
                                                  List<dynamic> list = (provider
                                                              .books[index]
                                                              .authorName
                                                          as List<dynamic>)
                                                      .where(
                                                        (element) =>
                                                            element != null,
                                                      )
                                                      .toList();

                                                  for (var i = 0;
                                                      i < list.length;
                                                      i++) {
                                                    author += list[i];
                                                    author +=
                                                        ((list.length - 1) == i)
                                                            ? ''
                                                            : ', ';
                                                  }
                                                }
                                                return Text(
                                                  author,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.labelLarge!
                                                      .copyWith(
                                                    color: isLight
                                                        ? ColorConstant.black
                                                        : null,
                                                  ),
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 7),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.headphones,
                                                  color: isLight
                                                      ? ColorConstant.black
                                                      : appTheme.whiteA700,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  '${provider.books[index].originalAudiobookLength}m',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.labelLarge!
                                                      .copyWith(
                                                    color: isLight
                                                        ? ColorConstant.black
                                                        : null,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Icon(
                                                  Icons.visibility_outlined,
                                                  color: isLight
                                                      ? ColorConstant.black
                                                      : appTheme.whiteA700,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  '${provider.books[index].originalAudiobookLength}m',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: theme
                                                      .textTheme.labelLarge!
                                                      .copyWith(
                                                    color: isLight
                                                        ? ColorConstant.black
                                                        : null,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
                  Consumer<HomePovider>(
                    builder: (context, provider, child) {
                      return provider.dashboardModel.recentlyAddBook.isNotEmpty
                          ? Padding(
                              padding: getPadding(left: 1, top: 30, right: 12),
                              child: Row(
                                children: [
                                  Text(
                                    'Recently Added',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        theme.textTheme.headlineSmall!.copyWith(
                                      color:
                                          isLight ? ColorConstant.black : null,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      context.push(
                                        AppRoutesPath.viewAllBook,
                                        extra: {
                                          'title': 'Recently Added',
                                          'param': 'recently_added',
                                        },
                                      );
                                    },
                                    child: Padding(
                                      padding: getPadding(top: 7, bottom: 7),
                                      child: Text(
                                        'Show all',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.labelLargeTeal400,
                                      ),
                                    ),
                                  ),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgArrowrightTeal400,
                                    height: getSize(16),
                                    width: getSize(16),
                                    margin:
                                        getMargin(left: 4, top: 4, bottom: 4),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                  Consumer<HomePovider>(
                    builder: (context, provider, child) {
                      return provider.dashboardModel.recentlyAddBook.isNotEmpty
                          ? Padding(
                              padding: getPadding(top: 20, bottom: 20),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    provider
                                        .dashboardModel.recentlyAddBook.length,
                                    (index) => BookTile(
                                      book: provider.dashboardModel
                                          .recentlyAddBook[index],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
