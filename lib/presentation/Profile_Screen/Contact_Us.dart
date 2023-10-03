// ignore_for_file: file_names

import 'dart:convert';

import 'package:book/core/app_export.dart';
import 'package:book/core/storage/app_storage.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/user_model.dart';
import 'package:book/provider/profile_provider.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    String user = await AppStorage().getUser();
    UserModel userModel = UserModel.fromJson(jsonDecode(user));
    nameController.text = userModel.name!;
    emailController.text = userModel.email!;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                AppbarSubtitle(text: 'Contact Us'),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SizedBox(
              height: height,
              width: width,
              // color: Colors.red,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      // color: Colors.red[300],
                      child: CustomImageView(
                        imagePath: ImageConstant.contactUsPng,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your Name',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleMediumWhiteA500.copyWith(
                        color: isLight ? ColorConstant.black : null,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 30),
                    child: CustomTextFormField(
                      controller: nameController,
                      margin: getMargin(
                        top: 1,
                      ),
                      contentPadding: getPadding(
                        left: 16,
                        top: 15,
                        right: 16,
                        bottom: 15,
                      ),
                      textStyle: CustomTextStyles.bodyMediumGray200.copyWith(
                        color: isLight ? ColorConstant.black : null,
                      ),
                      hintText: 'Enter Your Name',
                      // enabled: false,
                      hintStyle: CustomTextStyles.bodyMediumGray200,
                      textInputType: TextInputType.emailAddress,
                      filled: true,

                      fillColor: isLight
                          ? ColorConstant.kF3F3F3
                          : appTheme.grayTextfiled,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleMediumWhiteA500.copyWith(
                        color: isLight ? ColorConstant.black : null,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 30),
                    child: CustomTextFormField(
                      controller: emailController,
                      margin: getMargin(
                        top: 1,
                      ),
                      contentPadding: getPadding(
                        left: 16,
                        top: 15,
                        right: 16,
                        bottom: 15,
                      ),
                      textStyle: CustomTextStyles.bodyMediumGray200.copyWith(
                        color: isLight ? ColorConstant.black : null,
                      ),
                      hintText: 'Enter Your Mail ID',
                      // enabled: false,

                      hintStyle: CustomTextStyles.bodyMediumGray200,
                      textInputType: TextInputType.emailAddress,
                      filled: true,

                      fillColor: isLight
                          ? ColorConstant.kF3F3F3
                          : appTheme.grayTextfiled,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Subject',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleMediumWhiteA500.copyWith(
                        color: isLight ? ColorConstant.black : null,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 30),
                    child: CustomTextFormField(
                      controller: subjectController,
                      margin: getMargin(
                        top: 1,
                      ),
                      contentPadding: getPadding(
                        left: 16,
                        top: 15,
                        right: 16,
                        bottom: 15,
                      ),

                      textStyle: CustomTextStyles.bodyMediumGray200.copyWith(
                        color: isLight ? ColorConstant.black : null,
                      ),
                      hintText: 'Enter Your Subject',
                      // enabled: false,
                      hintStyle: CustomTextStyles.bodyMediumGray200,
                      textInputType: TextInputType.emailAddress,
                      filled: true,

                      fillColor: isLight
                          ? ColorConstant.kF3F3F3
                          : appTheme.grayTextfiled,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Message',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleMediumWhiteA500.copyWith(
                        color: isLight ? ColorConstant.black : null,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: CustomTextFormField(
                      controller: messageController,

                      margin: getMargin(
                        top: 1,
                      ),
                      contentPadding: getPadding(
                        left: 16,
                        top: 15,
                        right: 16,
                        bottom: 15,
                      ),
                      textStyle: CustomTextStyles.bodyMediumGray200.copyWith(
                        color: isLight ? ColorConstant.black : null,
                      ),
                      hintText: 'Enter Your Message',
                      // enabled: false,

                      hintStyle: CustomTextStyles.bodyMediumGray200,
                      textInputType: TextInputType.multiline,
                      maxLines: 4,
                      minLines: 1,
                      filled: true,
                      fillColor: isLight
                          ? ColorConstant.kF3F3F3
                          : appTheme.grayTextfiled,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: CustomElevatedButton(
                      onTap: onSubmit,
                      width: double.maxFinite,
                      height: getVerticalSize(48),
                      text: 'Send',
                      // margin: getMargin(top: 188),
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
      ),
    );
  }

  void onSubmit() {
    var name = validateName(nameController.text);
    if (name == 'Name must be more than 2 charater') {
      SnackBar snackBar = SnackBar(
        content: const Text('Name must be more than 2 charater'),
        backgroundColor: appTheme.teal400,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var velidEmail = emailV(emailController.text);
      if (velidEmail == false) {
        SnackBar snackBar = SnackBar(
          content: const Text('Please enter a valid email address'),
          backgroundColor: appTheme.teal400,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        if (subjectController.text.trim().isEmpty ||
            messageController.text.trim().isEmpty) {
          SnackBar snackBar = SnackBar(
            content: const Text('Please fill subject and message'),
            backgroundColor: appTheme.teal400,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          context.read<ProfileProvider>().contactUs(
                context,
                name: nameController.text.trim(),
                email: emailController.text.trim(),
                subject: subjectController.text.trim(),
                message: messageController.text.trim(),
              );
        }
      }
    }
  }

  emailV(String email) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
    return emailValid;
  }

  validateName(String value) {
    if (value.length < 3) {
      return 'Name must be more than 2 charater';
    } else {
      return null;
    }
  }
}
