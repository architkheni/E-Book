import 'package:book/core/app_export.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../langugaes_screen/langugaes_screen.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<int> selectedChoices = [];

  @override
  void initState() {
    selectedChoices = [];
    super.initState();
  }

  @override
  void dispose() {
    selectedChoices = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        appBar: CustomAppBar(
            height: 60,
            leadingWidth: 35,
            leading: Container(
              // color: Colors.red,
              child: AppbarImage(
                  height: 20,
                  width: 15,
                  svgPath: ImageConstant.imgArrowleftBlueGray50,
                  margin: getMargin(left: 16, top: 17, bottom: 18),
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ),
            title: Padding(
                padding: getPadding(left: 11),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppbarSubtitle(text: "Select Categories"),
                    ]))),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(top: 0, bottom: 41),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: IntrinsicWidth(
                  child: Container(
                    height: height / 2.5,
                    width: width,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: getPadding(
                            left: 16, top: 22, right: 16, bottom: 22),
                        decoration: AppDecoration.fill.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: getPadding(top: 2),
                              child: Text(
                                "Select the type of book you enjoy reading.",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.bodyMediumThin,
                              ),
                            ),
                            Spacer(),
                            Center(
                              child: Wrap(
                                runSpacing: 5,
                                spacing: 5,
                                children: List<Widget>.generate(
                                  9,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: RawChip(
                                      // padding: getPadding(right: 16),
                                      showCheckmark: false,
                                      labelPadding: EdgeInsets.zero,
                                      label: Text(
                                        "Persona ",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: appTheme.blueGray50,
                                          fontSize: 12,
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                      avatar: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgGroup1171274896,
                                        height: 12,
                                        width: 12,
                                        margin: getMargin(right: 10),
                                      ),
                                      selected: selectedChoices.contains(index),
                                      backgroundColor:
                                          theme.colorScheme.primary,
                                      selectedColor: appTheme.teal400,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide.none,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      onSelected: (value) {
                                        setState(() {
                                          selectedChoices.contains(index)
                                              ? selectedChoices.remove(index)
                                              : selectedChoices.add(index);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            CustomElevatedButton(
                              onTap: () {
                                if (selectedChoices.length <= 2) {
                                  SnackBar snackBar = SnackBar(
                                    content:
                                        Text("Select minimum 3 Categories"),
                                    backgroundColor: appTheme.teal400,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  // TODO: category select api
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LangugaesScreen(
                                              start: true,
                                            )),
                                  );
                                }
                              },
                              width: double.maxFinite,
                              height: getVerticalSize(48),
                              text: "Continue",
                              // margin: getMargin(top: 188),
                              buttonStyle: CustomButtonStyles.fillTeal400,
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallPrimary_1,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: getPadding(top: 12),
                                child: Text(
                                  "Select 3 or more genres to continue",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.bodySmallGray400,
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
    );
  }
}
