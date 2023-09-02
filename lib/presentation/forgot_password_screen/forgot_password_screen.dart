import 'package:book/core/app_export.dart';
import 'package:book/presentation/forgot_password_one_screen/forgot_password_one_screen.dart';
import 'package:book/provider/auth_provider.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  final String email;
  ForgotPasswordScreen({Key? key, required this.email}) : super(key: key);

  TextEditingController entercodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor:
                theme.colorScheme.onPrimaryContainer.withOpacity(1),
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 32, right: 16, bottom: 32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgArrowleft,
                          height: getSize(24),
                          width: getSize(24),
                          onTap: () {
                            onTapImgArrowleft(context);
                          }),
                      Spacer(),
                      Padding(
                          padding: getPadding(left: 16),
                          child: Text("Verify Code",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.headlineLarge)),
                      Container(
                          margin: getMargin(top: 15, bottom: 100),
                          padding: getPadding(
                              left: 16, top: 23, right: 16, bottom: 23),
                          decoration: AppDecoration.fill.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder12),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: getHorizontalSize(317),
                                    margin: getMargin(right: 8),
                                    child: Text(
                                        "An authentication code has been sent to your email.",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            CustomTextStyles.bodyMediumThin)),
                                CustomTextFormField(
                                    controller: entercodeController,
                                    margin: getMargin(top: 24),
                                    contentPadding: getPadding(
                                        left: 12,
                                        top: 15,
                                        right: 12,
                                        bottom: 15),
                                    textStyle:
                                        CustomTextStyles.bodyMediumGray500,
                                    hintText: "Enter Code",
                                    hintStyle:
                                        CustomTextStyles.bodyMediumGray500,
                                    filled: true,
                                    fillColor: appTheme.blueGray50),
                                CustomElevatedButton(
                                    onTap: () {
                                      // TODO: verify-token api
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPasswordOneScreen(
                                                  email: email,
                                                )),
                                      );
                                    },
                                    width: double.maxFinite,
                                    height: getVerticalSize(48),
                                    text: "Verify",
                                    margin: getMargin(top: 16),
                                    buttonStyle: CustomButtonStyles.fillTeal400,
                                    buttonTextStyle:
                                        CustomTextStyles.titleSmallPrimary_1),
                                Padding(
                                    padding: getPadding(
                                        left: 48, top: 23, bottom: 1),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Don’t receive a code?",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .bodyMediumThin),
                                          GestureDetector(
                                            onTap: () {
                                              // TODO: resend-otp api
                                              context
                                                  .read<AuthProvider>()
                                                  .resendOtp(context,
                                                      email: email);
                                            },
                                            child: Padding(
                                                padding: getPadding(left: 8),
                                                child: Text("Resend",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles
                                                        .titleSmallTeal400)),
                                          ),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgUilreload,
                                              height: getSize(14),
                                              width: getSize(14),
                                              margin:
                                                  getMargin(left: 4, top: 2))
                                        ]))
                              ])),
                      Spacer(),
                    ]))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
