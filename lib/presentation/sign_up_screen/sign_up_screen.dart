import 'dart:io';

import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/provider/auth_provider.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    bool isLight = Theme.of(context).brightness == Brightness.light;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: getPadding(left: 16, top: 23, right: 16, bottom: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 16,
                    ),
                    child: Text(
                      'Sign up',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: isLight
                          ? theme.textTheme.headlineLarge!
                              .copyWith(color: Colors.black)
                          : theme.textTheme.headlineLarge,
                    ),
                  ),
                  Container(
                    margin: getMargin(top: 10, bottom: 5),
                    padding:
                        getPadding(left: 16, top: 22, right: 16, bottom: 22),
                    decoration: AppDecoration.fill.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                      color: isLight ? ColorConstant.kF3F3F3 : null,
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
                            'Looks like you don’t have an account.\nLet’s create a new account for you.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.bodyMediumThin.copyWith(
                              color: isLight ? ColorConstant.black : null,
                            ),
                          ),
                        ),
                        CustomTextFormField(
                          controller: nameController,
                          margin: getMargin(top: 21),
                          contentPadding: getPadding(
                            left: 16,
                            top: 15,
                            right: 16,
                            bottom: 15,
                          ),
                          textStyle: CustomTextStyles.bodyMediumGray500,
                          hintText: 'Name',
                          hintStyle: CustomTextStyles.bodyMediumGray500,
                          textInputAction: TextInputAction.next,
                          filled: true,
                          fillColor: isLight
                              ? ColorConstant.kE1E1E1
                              : appTheme.blueGray50,
                        ),
                        CustomTextFormField(
                          controller: userNameController,
                          margin: getMargin(top: 15),
                          contentPadding: getPadding(
                            left: 16,
                            top: 15,
                            right: 16,
                            bottom: 15,
                          ),
                          textStyle: CustomTextStyles.bodyMediumGray500,
                          hintText: 'User Name',
                          hintStyle: CustomTextStyles.bodyMediumGray500,
                          textInputAction: TextInputAction.next,
                          filled: true,
                          fillColor: isLight
                              ? ColorConstant.kE1E1E1
                              : appTheme.blueGray50,
                        ),
                        CustomTextFormField(
                          controller: mobileNumberController,
                          margin: getMargin(top: 15),
                          contentPadding: getPadding(
                            left: 16,
                            top: 15,
                            right: 16,
                            bottom: 15,
                          ),
                          textStyle: CustomTextStyles.bodyMediumGray500,
                          hintText: 'Mobile Number',
                          hintStyle: CustomTextStyles.bodyMediumGray500,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.phone,
                          maxLength: 10,
                          filled: true,
                          fillColor: isLight
                              ? ColorConstant.kE1E1E1
                              : appTheme.blueGray50,
                        ),
                        CustomTextFormField(
                          controller: emailController,
                          margin: getMargin(top: 15),
                          contentPadding: getPadding(
                            left: 16,
                            top: 15,
                            right: 16,
                            bottom: 15,
                          ),
                          textStyle: CustomTextStyles.bodyMediumGray500,
                          hintText: 'Email',
                          hintStyle: CustomTextStyles.bodyMediumGray500,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.emailAddress,
                          filled: true,
                          fillColor: isLight
                              ? ColorConstant.kE1E1E1
                              : appTheme.blueGray50,
                        ),
                        CustomTextFormField(
                          controller: passwordController,
                          margin: getMargin(top: 16),
                          contentPadding:
                              getPadding(left: 16, top: 15, bottom: 15),
                          textStyle: CustomTextStyles.bodyMediumGray500,
                          hintText: 'Password',
                          hintStyle: CustomTextStyles.bodyMediumGray500,
                          textInputType: TextInputType.visiblePassword,
                          suffix: IconButton(
                            splashColor: Colors.transparent,
                            iconSize: 23,
                            onPressed: () {
                              setState(() {
                                obsecure = !obsecure;
                              });
                            },
                            icon: Icon(
                              obsecure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            color: isLight
                                ? ColorConstant.kE1E1E1
                                : appTheme.blueGray50,
                          ),
                          suffixConstraints: BoxConstraints(
                            maxHeight: getVerticalSize(48),
                          ),
                          obscureText: obsecure,
                          filled: true,
                          fillColor: isLight
                              ? ColorConstant.kE1E1E1
                              : appTheme.blueGray50,
                        ),
                        Container(
                          width: getHorizontalSize(320),
                          margin: getMargin(top: 16, right: 5),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'By selecting Create Account below, I agree to ',
                                  style: CustomTextStyles.bodyMediumThin_1
                                      .copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: CustomTextStyles.titleSmallTeal400_1,
                                ),
                                TextSpan(
                                  text: ' & ',
                                  style: CustomTextStyles.bodyMediumThin_1,
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: CustomTextStyles.titleSmallTeal400_1,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomElevatedButton(
                          onTap: () {
                            var name = validateName(nameController.text);
                            if (name == 'Name must be more than 2 charater') {
                              SnackBar snackBar = SnackBar(
                                content: const Text(
                                  'Name must be more than 2 charater',
                                ),
                                backgroundColor: appTheme.teal400,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              if (userNameController.text == '') {
                                SnackBar snackBar = SnackBar(
                                  content: const Text('Enter User Name'),
                                  backgroundColor: appTheme.teal400,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                var number =
                                    validateMobile(mobileNumberController.text);
                                if (number ==
                                    'Mobile Number must be of 10 digit') {
                                  SnackBar snackBar = SnackBar(
                                    content: const Text(
                                      'Mobile Number must be of 10 digit',
                                    ),
                                    backgroundColor: appTheme.teal400,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  var velidEmail = emailV(emailController.text);
                                  if (velidEmail == false) {
                                    SnackBar snackBar = SnackBar(
                                      content: const Text(
                                        'Please enter a valid email address',
                                      ),
                                      backgroundColor: appTheme.teal400,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    if (passwordController.text
                                        .trim()
                                        .isEmpty) {
                                      SnackBar snackBar = SnackBar(
                                        content:
                                            const Text('Password is not empty'),
                                        backgroundColor: appTheme.teal400,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      return;
                                    }
                                    if (passwordController.text.trim().length <
                                        8) {
                                      SnackBar snackBar = SnackBar(
                                        content: const Text(
                                          'Password length must be greater than 8 characters',
                                        ),
                                        backgroundColor: appTheme.teal400,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      return;
                                    }
                                    if (passwordController.text
                                        .trim()
                                        .contains(' ')) {
                                      SnackBar snackBar = SnackBar(
                                        content: const Text(
                                          'Password not contain space',
                                        ),
                                        backgroundColor: appTheme.teal400,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      return;
                                    }
                                    context.read<AuthProvider>().register(
                                          context,
                                          name: nameController.text,
                                          username: userNameController.text,
                                          mobileNo: mobileNumberController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                  }
                                }
                              }
                            }
                          },
                          width: double.maxFinite,
                          height: getVerticalSize(
                            48,
                          ),
                          text: 'Create Account',
                          margin: getMargin(
                            top: 13,
                          ),
                          buttonStyle: CustomButtonStyles.fillTeal400,
                          buttonTextStyle:
                              CustomTextStyles.titleSmallPrimary_1.copyWith(
                            color: isLight ? ColorConstant.whiteA700 : null,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 24,
                            bottom: 24,
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
                                'Or',
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
                          height: 48,
                          text: 'Login with Facebook',
                          margin: getMargin(top: 0),
                          leftIcon: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgFacebook,
                              height: 23,
                              width: 23,
                            ),
                          ),
                          buttonStyle:
                              CustomButtonStyles.fillBluegray50.copyWith(
                            backgroundColor: MaterialStateProperty.all(
                              isLight
                                  ? ColorConstant.kE1E1E1
                                  : ColorConstant.kEAF4F4,
                            ),
                          ),
                          buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: CustomElevatedButton(
                            width: double.maxFinite,
                            height: 48,
                            text: 'Login with Google',
                            leftIcon: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgImage2,
                                height: 23,
                                width: 23,
                              ),
                            ),
                            buttonStyle:
                                CustomButtonStyles.fillBluegray50.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                isLight
                                    ? ColorConstant.kE1E1E1
                                    : ColorConstant.kEAF4F4,
                              ),
                            ),
                            buttonTextStyle:
                                CustomTextStyles.titleSmallPrimary_1,
                          ),
                        ),
                        Platform.isAndroid
                            ? const SizedBox.shrink()
                            : CustomElevatedButton(
                                width: double.maxFinite,
                                height: getVerticalSize(
                                  48,
                                ),
                                text: 'Login with Apple',
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
                                buttonTextStyle:
                                    CustomTextStyles.titleSmallPrimary_1,
                              ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              top: 25,
                            ),
                            child: Row(
                              children: [
                                const Spacer(),
                                Text(
                                  'Already have an account? ',
                                  style: CustomTextStyles.bodyMediumThin_1
                                      .copyWith(
                                    color: isLight ? ColorConstant.black : null,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Log in',
                                    style: CustomTextStyles.titleSmallTeal400_1,
                                  ),
                                ),
                                const Spacer(),
                              ],
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
      ),
    );
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

  validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }
}
