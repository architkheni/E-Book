import 'package:book/core/utils/image_constant.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:flutter/material.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
              AppbarSubtitle(text: "Profile details"),
            ])),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          height: _height,
          width: _width,
          // color: Colors.red,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                    width: 100,
                    height: 100,
                    // color: Colors.red[300],
                    child: CircleAvatar(
                      backgroundImage: AssetImage(ImageConstant.profile),
                    )),
              ),
              Text(
                "Chnage Profile Picture",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.titleMediumWhiteA400,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: Container(
                  height: 0.5,
                  color: appTheme.gray700,
                ),
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
                  hintText: "John Doe",
                  enabled: false,
                  hintStyle: CustomTextStyles.bodyMediumGray200,
                  textInputType: TextInputType.emailAddress,
                  filled: true,

                  fillColor: appTheme.GrayTextfiled,
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
                  hintText: "john.doe@gmail.com",
                  enabled: false,

                  hintStyle: CustomTextStyles.bodyMediumGray200,
                  textInputType: TextInputType.emailAddress,
                  filled: true,

                  fillColor: appTheme.GrayTextfiled,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Date of Birth",
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
                  hintText: "23-12-1999",
                  enabled: false,
                  hintStyle: CustomTextStyles.bodyMediumGray200,
                  textInputType: TextInputType.emailAddress,
                  filled: true,

                  fillColor: appTheme.GrayTextfiled,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
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
                  hintText: "**********",
                  enabled: false,

                  hintStyle: CustomTextStyles.bodyMediumGray200,
                  textInputType: TextInputType.emailAddress,
                  filled: true,

                  fillColor: appTheme.GrayTextfiled,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
