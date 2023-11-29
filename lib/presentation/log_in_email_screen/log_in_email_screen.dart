import 'dart:io';

import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/provider/auth_provider.dart' as auth;
import 'package:book/router/app_routes.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LogInEmailScreen extends StatefulWidget {
  const LogInEmailScreen({Key? key}) : super(key: key);

  @override
  State<LogInEmailScreen> createState() => _LogInEmailScreenState();
}

class _LogInEmailScreenState extends State<LogInEmailScreen> {
  bool isCheckbox = false;
  bool obsecure = true;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    bool isLight = Theme.of(context).brightness == Brightness.light;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    'Log in',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: isLight
                        ? theme.textTheme.headlineLarge!
                            .copyWith(color: Colors.black)
                        : theme.textTheme.headlineLarge,
                  ),
                ),
                Container(
                  margin: getMargin(top: 15, bottom: 5),
                  padding: getPadding(left: 16, top: 22, right: 16, bottom: 22),
                  decoration: AppDecoration.fill.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                    color: isLight ? ColorConstant.kF3F3F3 : null,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        controller: emailController,
                        margin: getMargin(top: 1),
                        contentPadding: getPadding(
                          left: 16,
                          top: 15,
                          right: 16,
                          bottom: 15,
                        ),
                        textStyle: CustomTextStyles.bodyMediumGray500,
                        hintText: 'Email',
                        hintStyle: CustomTextStyles.bodyMediumGray500,
                        textInputType: TextInputType.emailAddress,
                        filled: true,
                        fillColor: isLight
                            ? ColorConstant.kE1E1E1
                            : appTheme.blueGray50,
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        margin: getMargin(top: 24),
                        contentPadding:
                            getPadding(left: 16, top: 15, bottom: 15),
                        textStyle: CustomTextStyles.bodyMediumGray500,
                        hintText: 'Password',
                        hintStyle: CustomTextStyles.bodyMediumGray500,
                        textInputType: TextInputType.visiblePassword,
                        suffix: IconButton(
                          iconSize: 23,
                          onPressed: () {
                            setState(() {
                              obsecure = !obsecure;
                            });
                          },
                          splashColor: Colors.transparent,
                          icon: Icon(
                            obsecure ? Icons.visibility_off : Icons.visibility,
                          ),
                          color: appTheme.gray500,
                        ),
                        suffixConstraints:
                            BoxConstraints(maxHeight: getVerticalSize(48)),
                        obscureText: obsecure,
                        filled: true,
                        fillColor: isLight
                            ? ColorConstant.kE1E1E1
                            : appTheme.blueGray50,
                      ),
                      CustomElevatedButton(
                        onTap: () {
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
                            return;
                          }
                          if (passwordController.text.trim().isEmpty) {
                            SnackBar snackBar = SnackBar(
                              content: const Text('Password is not empty'),
                              backgroundColor: appTheme.teal400,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            return;
                          }
                          if (passwordController.text.trim().length < 8) {
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
                          if (passwordController.text.trim().contains(' ')) {
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
                          context.read<auth.AuthProvider>().logIn(
                                context,
                                email: emailController.text,
                                password: passwordController.text.trim(),
                              );
                        },
                        width: double.maxFinite,
                        height: getVerticalSize(48),
                        text: 'Continue',
                        margin: getMargin(top: 16),
                        buttonStyle: CustomButtonStyles.fillTeal400,
                        buttonTextStyle:
                            CustomTextStyles.titleSmallPrimary_1.copyWith(
                          color: isLight ? ColorConstant.whiteA700 : null,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          var velidEmail = emailV(emailController.text);
                          if (velidEmail == true) {
                            context.read<auth.AuthProvider>().forgotPassword(
                                  context,
                                  email: emailController.text.trim(),
                                );
                          } else {
                            SnackBar snackBar = SnackBar(
                              content:
                                  const Text('Please enter a email address'),
                              backgroundColor: appTheme.teal400,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Padding(
                          padding: getPadding(top: 16),
                          child: Text(
                            'Forgot password?',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.titleSmallTeal400,
                          ),
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
                              'Or',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodyMediumGray500,
                            ),
                            Padding(
                              padding: getPadding(top: 7, bottom: 8),
                              child: SizedBox(
                                width: 138,
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
                        onTap: () async {
                          final LoginResult result =
                              await FacebookAuth.instance.login();
                          if (result.status == LoginStatus.success) {
                            final data =
                                await FacebookAuth.instance.getUserData();
                            print(data);
                          }
                        },
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
                        buttonStyle: CustomButtonStyles.fillBluegray50.copyWith(
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
                          onTap: () async {
                            auth.AuthProvider authProvider =
                                context.read<auth.AuthProvider>();
                            ScaffoldMessengerState scaffoldState =
                                ScaffoldMessenger.of(context);
                            try {
                              GoogleSignIn googleSighin = GoogleSignIn();
                              GoogleSignInAccount? account =
                                  await googleSighin.signIn();
                              if (account == null) {
                                return;
                              }
                              GoogleSignInAuthentication auth =
                                  await account.authentication;
                              OAuthCredential credential =
                                  GoogleAuthProvider.credential(
                                accessToken: auth.accessToken,
                                idToken: auth.idToken,
                              );
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithCredential(credential);
                              // ignore: use_build_context_synchronously
                              authProvider.ssoCreate(
                                context,
                                email: userCredential.user?.email ?? '',
                              );
                            } on FirebaseAuthException catch (e) {
                              String error = getErrorMessage(e.code);
                              scaffoldState.showSnackBar(
                                SnackBar(
                                  content: Text(error),
                                  backgroundColor: appTheme.teal400,
                                ),
                              );
                            }
                          },
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
                          buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                        ),
                      ),
                      Platform.isAndroid
                          ? const SizedBox.shrink()
                          : CustomElevatedButton(
                              width: double.maxFinite,
                              height: 48,
                              text: 'Login with Apple',
                              margin: getMargin(top: 16),
                              leftIcon: Container(
                                margin: getMargin(right: 30),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgUser,
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
                      Padding(
                        padding: getPadding(top: 33),
                        child: Row(
                          children: [
                            const Spacer(),
                            Text(
                              'Don’t have an account? ',
                              style: CustomTextStyles.bodyMediumThin_1.copyWith(
                                color: isLight ? ColorConstant.black : null,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.push(AppRoutesPath.signUp);
                              },
                              child: Text(
                                'Sign up',
                                style: CustomTextStyles.titleSmallTeal400_1,
                              ),
                            ),
                            const Spacer(),
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

  emailV(String email) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
    return emailValid;
  }

  String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'email-already-exists':
        return 'Email id already exist';
      case 'user-not-found':
        return 'Email id not exist';
      case 'wrong-password':
        return 'Invalid password';
      case 'email-already-in-use':
        return 'Email id already in use';
      default:
        return 'Some error accurred';
    }
  }
}
