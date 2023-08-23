import 'dart:io';
import 'package:book/core/app_export.dart';
import 'package:book/presentation/log_in_password_screen/log_in_password_screen.dart';
import 'package:book/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../core/utils/color_constant.dart';
import '../forgot_password_screen/forgot_password_screen.dart';

class LogInEmailScreen extends StatefulWidget {
  LogInEmailScreen({Key? key}) : super(key: key);

  @override
  State<LogInEmailScreen> createState() => _LogInEmailScreenState();
}

class _LogInEmailScreenState extends State<LogInEmailScreen> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? theme.colorScheme.onPrimaryContainer.withOpacity(1)
            : ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: getPadding(left: 16),
                  child: Text(
                    "Log in",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
                Container(
                  margin: getMargin(top: 15, bottom: 5),
                  padding: getPadding(left: 16, top: 22, right: 16, bottom: 22),
                  decoration: AppDecoration.fill.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        controller: emailController,
                        margin: getMargin(top: 1),
                        contentPadding: getPadding(
                            left: 16, top: 15, right: 16, bottom: 15),
                        textStyle: CustomTextStyles.bodyMediumGray500,
                        hintText: "Email",
                        hintStyle: CustomTextStyles.bodyMediumGray500,
                        textInputType: TextInputType.emailAddress,
                        filled: true,
                        fillColor: appTheme.blueGray50,
                      ),
                      CustomElevatedButton(
                        onTap: () {
                          var velidEmail = emailV(emailController.text);
                          if (velidEmail == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInPasswordScreen(
                                        email: emailController.text,
                                      )),
                            );
                          } else {
                            SnackBar snackBar = SnackBar(
                              content:
                                  Text("Please enter a valid email address"),
                              backgroundColor: appTheme.teal400,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        width: double.maxFinite,
                        height: getVerticalSize(48),
                        text: "Continue",
                        margin: getMargin(top: 16),
                        buttonStyle: CustomButtonStyles.fillTeal400,
                        buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()),
                          );
                        },
                        child: Padding(
                          padding: getPadding(top: 16),
                          child: Text(
                            "Forgot password?",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.titleSmallTeal400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 32,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: getPadding(top: 7, bottom: 8),
                              child: SizedBox(
                                width: getHorizontalSize(138),
                                child: Divider(
                                  height: getVerticalSize(1),
                                  thickness: getVerticalSize(1),
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                            Text(
                              "Or",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodyMediumGray500,
                            ),
                            Padding(
                              padding: getPadding(top: 7, bottom: 8),
                              child: SizedBox(
                                width: getHorizontalSize(138),
                                child: Divider(
                                  height: getVerticalSize(1),
                                  thickness: getVerticalSize(
                                    1,
                                  ),
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomElevatedButton(
                        width: double.maxFinite,
                        height: getVerticalSize(48),
                        text: "Login with Facebook",
                        margin: getMargin(top: 31),
                        leftIcon: Container(
                          margin: getMargin(right: 30),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgFacebook,
                          ),
                        ),
                        buttonStyle: CustomButtonStyles.fillBluegray50,
                        buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                      ),
                      CustomElevatedButton(
                        width: double.maxFinite,
                        height: getVerticalSize(48),
                        text: "Login with Google",
                        margin: getMargin(top: 16),
                        leftIcon: Container(
                          margin: getMargin(right: 30),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgImage2,
                            height: getSize(23),
                            width: getSize(23),
                          ),
                        ),
                        buttonStyle: CustomButtonStyles.fillBluegray50,
                        buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                      ),
                      Platform.isAndroid
                          ? SizedBox.shrink()
                          : CustomElevatedButton(
                              width: double.maxFinite,
                              height: getVerticalSize(48),
                              text: "Login with Apple",
                              margin: getMargin(top: 16),
                              leftIcon: Container(
                                margin: getMargin(right: 30),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgUser,
                                ),
                              ),
                              buttonStyle: CustomButtonStyles.fillBluegray50,
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallPrimary_1,
                            ),
                      Padding(
                        padding: getPadding(top: 33),
                        child: Row(
                          children: [
                            Spacer(),
                            Text(
                              "Don’t have an account? ",
                              style: CustomTextStyles.bodyMediumThin_1,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()),
                                );
                              },
                              child: Text(
                                "Sign up",
                                style: CustomTextStyles.titleSmallTeal400_1,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  emailV(String Email) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(Email);
    print(emailValid);
    return emailValid;
  }
}
