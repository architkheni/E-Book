import 'package:book/core/app_export.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../custom_bottom_bar/custom_bottom_bar.dart';

class LangugaesScreen extends StatefulWidget {
  bool? start;
  LangugaesScreen({Key? key, this.start}) : super(key: key);

  @override
  State<LangugaesScreen> createState() => _LangugaesScreenState();
}

int _selectedIndex = -1;
var NameArraya = ["English", "Malay", "Urdu"];

class _LangugaesScreenState extends State<LangugaesScreen> {
  @override
  void dispose() {
    _selectedIndex = -1;
    super.dispose();
  }

  @override
  void initState() {
    _selectedIndex = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        appBar: widget.start == true
            ? CustomAppBar(
                height: 60,
                leadingWidth: 35,
                leading: Container(
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
                          AppbarSubtitle(text: "Select Languages"),
                        ])),
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
                                  BottombarPage(buttomIndex: 0)),
                        );
                      },
                      child: Text(
                        "Skip",
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
                                  BottombarPage(buttomIndex: 0)),
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
                          AppbarSubtitle(text: "Select Languages"),
                        ]))),
        body: Container(
          width: getHorizontalSize(358),
          margin: getMargin(left: 16, top: 3, right: 16, bottom: 5),
          padding: getPadding(left: 16, top: 24, right: 16, bottom: 24),
          decoration: AppDecoration.fill.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: getPadding(top: 1),
                child: Text(
                  "Select languages you enjoy reading",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.bodyMediumThin,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(left: 21, top: 22),
                  child: Wrap(
                    runSpacing: getVerticalSize(5),
                    spacing: getHorizontalSize(5),
                    children: List<Widget>.generate(
                      NameArraya.length,
                      (index) => RawChip(
                        padding: getPadding(right: 16),
                        showCheckmark: false,
                        labelPadding: EdgeInsets.zero,
                        label: Text(
                          "${NameArraya[index]}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: appTheme.blueGray50,
                            fontSize: 15,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        avatar: _selectedIndex == index
                            ? CustomImageView(
                                imagePath: ImageConstant.Checked,
                                height: 23,
                                width: 23,
                                margin: getMargin(right: 10),
                              )
                            : CustomImageView(
                                imagePath: ImageConstant.uil_pluscircle,
                                height: 23,
                                width: 23,
                                margin: getMargin(right: 10),
                              ),
                        selected: _selectedIndex == index,
                        backgroundColor: theme.colorScheme.primary,
                        selectedColor: appTheme.teal400,
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(8),
                          ),
                        ),
                        onSelected: (value) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: CustomElevatedButton(
                  onTap: () {
                    if (_selectedIndex == -1) {
                      SnackBar snackBar = SnackBar(
                        content: Text("Select minimum 1 Languages"),
                        backgroundColor: appTheme.teal400,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BottombarPage(buttomIndex: 0)),
                      );
                    }
                  },
                  width: double.maxFinite,
                  height: getVerticalSize(48),
                  text: "Continue",
                  // margin: getMargin(top: 74),
                  buttonStyle: CustomButtonStyles.fillTeal400,
                  buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
