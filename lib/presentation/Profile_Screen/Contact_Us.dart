import 'package:book/core/app_export.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class ContactUsScreen extends StatefulWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              AppbarSubtitle(text: "Contact Us"),
            ])),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            height: _height,
            width: _width,
            // color: Colors.red,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Container(
                      width: 200,
                      height: 200,
                      // color: Colors.red[300],
                      child: CustomImageView(
                        imagePath: ImageConstant.contactUsPng,
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your Name",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleMediumWhiteA500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 30),
                  child: CustomTextFormField(
                    // controller: emailController,
                    margin: getMargin(
                      top: 1,
                    ),
                    contentPadding: getPadding(
                      left: 16,
                      top: 15,
                      right: 16,
                      bottom: 15,
                    ),
                    textStyle: CustomTextStyles.bodyMediumGray200,
                    hintText: "Enter Your Name",
                    // enabled: false,
                    hintStyle: CustomTextStyles.bodyMediumGray200,
                    textInputType: TextInputType.emailAddress,
                    filled: true,

                    fillColor: appTheme.grayTextfiled,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleMediumWhiteA500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 30),
                  child: CustomTextFormField(
                    // controller: emailController,
                    margin: getMargin(
                      top: 1,
                    ),
                    contentPadding: getPadding(
                      left: 16,
                      top: 15,
                      right: 16,
                      bottom: 15,
                    ),
                    textStyle: CustomTextStyles.bodyMediumGray200,
                    hintText: "Enter Your Mail ID",
                    // enabled: false,

                    hintStyle: CustomTextStyles.bodyMediumGray200,
                    textInputType: TextInputType.emailAddress,
                    filled: true,

                    fillColor: appTheme.grayTextfiled,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Subject",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleMediumWhiteA500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 30),
                  child: CustomTextFormField(
                    // controller: emailController,
                    margin: getMargin(
                      top: 1,
                    ),
                    contentPadding: getPadding(
                      left: 16,
                      top: 15,
                      right: 16,
                      bottom: 15,
                    ),

                    textStyle: CustomTextStyles.bodyMediumGray200,
                    hintText: "Enter Your Subject",
                    // enabled: false,
                    hintStyle: CustomTextStyles.bodyMediumGray200,
                    textInputType: TextInputType.emailAddress,
                    filled: true,

                    fillColor: appTheme.grayTextfiled,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Message",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleMediumWhiteA500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: CustomTextFormField(
                    // controller: emailController,

                    margin: getMargin(
                      top: 1,
                    ),
                    contentPadding: getPadding(
                      left: 16,
                      top: 15,
                      right: 16,
                      bottom: 15,
                    ),
                    textStyle: CustomTextStyles.bodyMediumGray200,
                    hintText: "Enter Your Message",
                    // enabled: false,

                    hintStyle: CustomTextStyles.bodyMediumGray200,
                    textInputType: TextInputType.emailAddress,
                    filled: true,

                    fillColor: appTheme.grayTextfiled,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: CustomElevatedButton(
                    onTap: () {},
                    width: double.maxFinite,
                    height: getVerticalSize(48),
                    text: "Send",
                    // margin: getMargin(top: 188),
                    buttonStyle: CustomButtonStyles.fillTeal400,
                    buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
