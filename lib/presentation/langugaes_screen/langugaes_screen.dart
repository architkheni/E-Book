import 'dart:convert';

import 'package:book/core/app_export.dart';
import 'package:book/core/storage/app_storage.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/language_model.dart';
import 'package:book/model/user_model.dart';
import 'package:book/presentation/langugaes_screen/provider/language_provider.dart';
import 'package:book/provider/profile_provider.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import '../custom_bottom_bar/custom_bottom_bar.dart';

class LangugaesScreen extends StatefulWidget {
  final bool? start;
  final bool? goIsProfile;
  const LangugaesScreen({Key? key, this.start, this.goIsProfile})
      : super(key: key);

  @override
  State<LangugaesScreen> createState() => _LangugaesScreenState();
}

class _LangugaesScreenState extends State<LangugaesScreen> {
  List<int> selectedId = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    String user = await AppStorage().getUser();
    UserModel userModel = UserModel.fromJson(jsonDecode(user));
    List<dynamic> languages = userModel.languages ?? [];
    for (var element in languages) {
      selectedId.add(element);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    bool isLight = Theme.of(context).brightness == Brightness.light;

    return ChangeNotifierProvider(
      create: (context) => LanguageProvider()..getAllLanguage(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: widget.start == true
              ? CustomAppBar(
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
                        AppbarSubtitle(text: 'Select Languages'),
                      ],
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BottombarPage(buttomIndex: 0),
                            ),
                          );
                        },
                        child: const Text(
                          'Skip',
                          // margin: getMargin( top: 20,),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 16, top: 10, left: 10),
                      child: AppbarImage(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BottombarPage(buttomIndex: 0),
                            ),
                          );
                        },
                        height: getVerticalSize(14),
                        width: getHorizontalSize(8),
                        svgPath: ImageConstant.imgArrowright,
                        // margin: getMargin(left: 10, top: 16, right: 16, bottom: 5),
                      ),
                    ),
                  ],
                )
              : CustomAppBar(
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
                        AppbarSubtitle(text: 'Select Languages'),
                      ],
                    ),
                  ),
                ),
          body: Container(
            width: getHorizontalSize(358),
            margin: getMargin(left: 16, top: 3, right: 16, bottom: 5),
            padding: getPadding(left: 16, top: 24, right: 16, bottom: 24),
            decoration: AppDecoration.fill.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
              color: isLight ? ColorConstant.kF3F3F3 : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select languages you enjoy reading',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.bodyMediumThin
                      .copyWith(color: isLight ? ColorConstant.black : null),
                ),
                Consumer<LanguageProvider>(
                  builder: (context, provider, child) {
                    List<LanguageModel> language = provider.language;
                    return Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(top: 22),
                        child: Wrap(
                          runSpacing: getVerticalSize(5),
                          spacing: getHorizontalSize(5),
                          children: List<Widget>.generate(
                            language.length,
                            (index) => RawChip(
                              padding: getPadding(right: 12, left: 5),
                              showCheckmark: false,
                              labelPadding: EdgeInsets.zero,
                              label: Text(
                                '${language[index].name}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: selectedId.contains(language[index].id)
                                      ? isLight
                                          ? ColorConstant.whiteA700
                                          : appTheme.blueGray50
                                      : isLight
                                          ? ColorConstant.black
                                          : appTheme.blueGray50,
                                  fontSize: 15,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              avatar: selectedId.contains(language[index].id)
                                  ? CustomImageView(
                                      imagePath: ImageConstant.checked,
                                      height: 23,
                                      width: 23,
                                      margin: getMargin(right: 10),
                                      color: isLight
                                          ? ColorConstant.whiteA700
                                          : null,
                                    )
                                  : CustomImageView(
                                      imagePath: ImageConstant.uilPluscircle,
                                      height: 23,
                                      width: 23,
                                      margin: getMargin(right: 10),
                                      color: selectedId
                                              .contains(language[index].id)
                                          ? null
                                          : isLight
                                              ? Colors.black
                                              : null,
                                    ),
                              selected: selectedId.contains(language[index].id),
                              backgroundColor: isLight
                                  ? Colors.transparent
                                  : theme.colorScheme.primary,
                              selectedColor: appTheme.teal400,
                              shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(8),
                                ),
                              ),
                              onSelected: (value) {
                                setState(() {
                                  if (selectedId.contains(language[index].id)) {
                                    selectedId.remove(language[index].id);
                                  } else {
                                    selectedId.add(language[index].id!);
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: CustomElevatedButton(
                    onTap: () {
                      if (selectedId.isEmpty) {
                        SnackBar snackBar = SnackBar(
                          content: const Text('Select a minimum of 1 language'),
                          backgroundColor: appTheme.teal400,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        //
                        context.read<ProfileProvider>().saveUserLanguage(
                              context,
                              language: selectedId,
                              onSuccess: widget.goIsProfile != null
                                  ? () {
                                      Navigator.pop(context);
                                    }
                                  : null,
                            );
                      }
                    },
                    width: double.maxFinite,
                    height: getVerticalSize(48),
                    text: 'Continue',
                    // margin: getMargin(top: 74),
                    buttonStyle: CustomButtonStyles.fillTeal400,
                    buttonTextStyle:
                        CustomTextStyles.titleSmallPrimary_1.copyWith(
                      color: isLight ? ColorConstant.whiteA700 : null,
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
