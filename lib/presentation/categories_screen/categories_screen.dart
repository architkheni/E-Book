import 'dart:convert';

import 'package:book/core/app_export.dart';
import 'package:book/core/storage/app_storage.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/category_model.dart';
import 'package:book/model/user_model.dart';
import 'package:book/provider/explore_provider.dart';
import 'package:book/provider/profile_provider.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class CategoriesScreen extends StatefulWidget {
  final bool? goIsProfile;
  const CategoriesScreen({Key? key, this.goIsProfile}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<int> selectedId = [];

  @override
  void initState() {
    context.read<ExploreProvider>().getAllCategories();
    init();
    super.initState();
  }

  void init() async {
    String user = await AppStorage().getUser();
    UserModel userModel = UserModel.fromJson(jsonDecode(user));
    List<int> categories = userModel.categories ?? [];
    selectedId.addAll(categories);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double width = MediaQuery.of(context).size.width;
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustomAppBar(
          height: 60,
          leadingWidth: 35,
          leading: AppbarImage(
            height: 20,
            width: 15,
            svgPath: ImageConstant.imgArrowleftBlueGray50,
            color: isLight ? ColorConstant.black : null,
            margin: getMargin(left: 16, top: 17, bottom: 18),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Padding(
            padding: getPadding(left: 11),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppbarSubtitle(text: 'Select Categories'),
              ],
            ),
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(top: 0, bottom: 41),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: IntrinsicWidth(
                    child: SizedBox(
                      // height: height / 2.5,
                      width: width,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: getPadding(
                            left: 16,
                            top: 22,
                            right: 16,
                            bottom: 22,
                          ),
                          decoration: AppDecoration.fill.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                            color: isLight ? ColorConstant.kF3F3F3 : null,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: getPadding(top: 2),
                                child: Text(
                                  'Select the type of book you enjoy reading.',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStyles.bodyMediumThin.copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: Consumer<ExploreProvider>(
                                  builder: (context, provider, child) {
                                    List<CategoryModel> categories =
                                        provider.categories;
                                    return Wrap(
                                      runSpacing: 5,
                                      spacing: 5,
                                      children: List<Widget>.generate(
                                        categories.length,
                                        (index) => Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: RawChip(
                                            // padding: getPadding(right: 16),
                                            showCheckmark: false,
                                            labelPadding: EdgeInsets.zero,
                                            label: Text(
                                              categories[index].name!,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: selectedId.contains(
                                                  categories[index].categoryId,
                                                )
                                                    ? ColorConstant.whiteA700
                                                    : isLight
                                                        ? ColorConstant.black
                                                        : appTheme.blueGray50,
                                                fontSize: 12,
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w100,
                                              ),
                                            ),
                                            avatar: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgGroup1171274896,
                                              height: 12,
                                              width: 12,
                                              margin: getMargin(right: 10),
                                              color: selectedId.contains(
                                                categories[index].categoryId,
                                              )
                                                  ? ColorConstant.whiteA700
                                                  : isLight
                                                      ? Colors.black
                                                      : null,
                                            ),
                                            selected: selectedId.contains(
                                              categories[index].categoryId,
                                            ),
                                            backgroundColor: isLight
                                                ? ColorConstant.kE1E1E1
                                                : theme.colorScheme.primary,
                                            selectedColor: appTheme.teal400,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            onSelected: (value) {
                                              setState(() {
                                                if (selectedId.contains(
                                                  categories[index].categoryId,
                                                )) {
                                                  selectedId.remove(
                                                    categories[index]
                                                        .categoryId!,
                                                  );
                                                } else {
                                                  selectedId.add(
                                                    categories[index]
                                                        .categoryId!,
                                                  );
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomElevatedButton(
                                onTap: () {
                                  if (selectedId.length <= 2) {
                                    SnackBar snackBar = SnackBar(
                                      content: const Text(
                                        'Select minimum 3 Categories',
                                      ),
                                      backgroundColor: appTheme.teal400,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    context
                                        .read<ProfileProvider>()
                                        .saveUserCategory(
                                          context,
                                          category: selectedId,
                                          onSuccess: widget.goIsProfile == null
                                              ? null
                                              : () {
                                                  Navigator.pop(context);
                                                },
                                        );
                                  }
                                },
                                width: double.maxFinite,
                                height: getVerticalSize(48),
                                text: 'Continue',
                                // margin: getMargin(top: 188),
                                buttonStyle: CustomButtonStyles.fillTeal400,
                                buttonTextStyle: CustomTextStyles
                                    .titleSmallPrimary_1
                                    .copyWith(
                                  color:
                                      isLight ? ColorConstant.whiteA700 : null,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: getPadding(top: 12),
                                  child: Text(
                                    'Select 3 or more genres to continue',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.bodySmallGray400
                                        .copyWith(
                                      color:
                                          isLight ? ColorConstant.black : null,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
