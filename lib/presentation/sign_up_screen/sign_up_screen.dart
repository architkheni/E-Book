import 'package:book/core/app_export.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 16,
              top: 23,
              right: 16,
              bottom: 23,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 16,
                  ),
                  child: Text(
                    "Sign up",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
                Container(
                  margin: getMargin(
                    top: 10,
                    bottom: 5,
                  ),
                  padding: getPadding(
                    left: 16,
                    top: 22,
                    right: 16,
                    bottom: 22,
                  ),
                  decoration: AppDecoration.fill.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: getHorizontalSize(
                          224,
                        ),
                        margin: getMargin(
                          top: 2,
                        ),
                        child: Text(
                          "Looks like you don’t have an account.\nLet’s create a new account for you.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.bodyMediumThin,
                        ),
                      ),
                      CustomTextFormField(
                        controller: nameController,
                        margin: getMargin(
                          top: 21,
                        ),
                        contentPadding: getPadding(
                          left: 16,
                          top: 15,
                          right: 16,
                          bottom: 15,
                        ),
                        textStyle: CustomTextStyles.bodyMediumGray500,
                        hintText: "Name",
                        hintStyle: CustomTextStyles.bodyMediumGray500,
                        textInputAction: TextInputAction.next,
                        filled: true,
                        fillColor: appTheme.blueGray50,
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        margin: getMargin(
                          top: 16,
                        ),
                        contentPadding: getPadding(
                          left: 16,
                          top: 15,
                          right: 16,
                          bottom: 15,
                        ),
                        textStyle: CustomTextStyles.bodyMediumGray500,
                        hintText: "Email",
                        hintStyle: CustomTextStyles.bodyMediumGray500,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        filled: true,
                        fillColor: appTheme.blueGray50,
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        margin: getMargin(
                          top: 16,
                        ),
                        contentPadding: getPadding(
                          left: 16,
                          top: 15,
                          bottom: 15,
                        ),
                        textStyle: CustomTextStyles.bodyMediumGray500,
                        hintText: "Password",
                        hintStyle: CustomTextStyles.bodyMediumGray500,
                        textInputType: TextInputType.visiblePassword,
                        suffix: Container(
                          margin: getMargin(
                            left: 30,
                            top: 12,
                            right: 16,
                            bottom: 12,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgEye,
                          ),
                        ),
                        suffixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(
                            48,
                          ),
                        ),
                        obscureText: true,
                        filled: true,
                        fillColor: appTheme.blueGray50,
                      ),
                      Container(
                        width: getHorizontalSize(
                          320,
                        ),
                        margin: getMargin(
                          top: 16,
                          right: 5,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "By selecting Create Account below, I agree to ",
                                style: CustomTextStyles.bodyMediumThin_1,
                              ),
                              TextSpan(
                                text: "Terms of Service",
                                style: CustomTextStyles.titleSmallTeal400_1,
                              ),
                              TextSpan(
                                text: " & ",
                                style: CustomTextStyles.bodyMediumThin_1,
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: CustomTextStyles.titleSmallTeal400_1,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomElevatedButton(
                        width: double.maxFinite,
                        height: getVerticalSize(
                          48,
                        ),
                        text: "Create Account",
                        margin: getMargin(
                          top: 13,
                        ),
                        buttonStyle: CustomButtonStyles.fillTeal400,
                        buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 8,
                                bottom: 8,
                              ),
                              child: SizedBox(
                                width: getHorizontalSize(
                                  138,
                                ),
                                child: Divider(
                                  height: getVerticalSize(
                                    1,
                                  ),
                                  thickness: getVerticalSize(
                                    1,
                                  ),
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
                              padding: getPadding(
                                top: 8,
                                bottom: 8,
                              ),
                              child: SizedBox(
                                width: getHorizontalSize(
                                  138,
                                ),
                                child: Divider(
                                  height: getVerticalSize(
                                    1,
                                  ),
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
                        height: getVerticalSize(
                          48,
                        ),
                        text: "Login with Facebook",
                        margin: getMargin(
                          top: 23,
                        ),
                        leftIcon: Container(
                          margin: getMargin(
                            right: 30,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgFacebook,
                          ),
                        ),
                        buttonStyle: CustomButtonStyles.fillBluegray50,
                        buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                      ),
                      CustomElevatedButton(
                        width: double.maxFinite,
                        height: getVerticalSize(
                          48,
                        ),
                        text: "Login with Google",
                        margin: getMargin(
                          top: 16,
                        ),
                        rightIcon: Container(
                          margin: getMargin(
                            left: 30,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgImage2,
                            height: getSize(
                              23,
                            ),
                            width: getSize(
                              23,
                            ),
                          ),
                        ),
                        buttonStyle: CustomButtonStyles.fillBluegray50,
                        buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                      ),
                      CustomElevatedButton(
                        width: double.maxFinite,
                        height: getVerticalSize(
                          48,
                        ),
                        text: "Login with Apple",
                        margin: getMargin(
                          top: 16,
                        ),
                        leftIcon: Container(
                          margin: getMargin(
                            right: 30,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgUser,
                          ),
                        ),
                        buttonStyle: CustomButtonStyles.fillBluegray50,
                        buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            top: 25,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account? ",
                                  style: CustomTextStyles.bodyMediumThin_1,
                                ),
                                TextSpan(
                                  text: "Log in",
                                  style: CustomTextStyles.titleSmallTeal400_1,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
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
}
