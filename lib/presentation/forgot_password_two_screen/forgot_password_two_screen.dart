import 'package:book/core/app_export.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordTwoScreen extends StatelessWidget {
  ForgotPasswordTwoScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(72),
          leadingWidth: 40,
          leading: AppbarImage(
            height: getSize(24),
            width: getSize(24),
            svgPath: ImageConstant.imgArrowleft,
            margin: getMargin(left: 16, top: 15, bottom: 16),
            onTap: () {
              onTapArrowleft(context);
            },
          ),
          title: AppbarSubtitle1(
            text: 'Back to Log in',
            margin: getMargin(left: 8),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(left: 16, top: 40, right: 16, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: getPadding(left: 16, top: 118),
                  child: Text(
                    'Recover Password',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
                Container(
                  margin: getMargin(top: 13),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: getHorizontalSize(322),
                        margin: getMargin(top: 2),
                        child: Text(
                          'Forgot your password? Don’t worry, enter your email to reset your current password.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.bodyMediumThin,
                        ),
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        margin: getMargin(top: 21),
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
                        fillColor: appTheme.blueGray50,
                      ),
                      CustomElevatedButton(
                        width: double.maxFinite,
                        height: getVerticalSize(48),
                        text: 'Sumbit',
                        margin: getMargin(top: 16),
                        buttonStyle: CustomButtonStyles.fillTeal400,
                        buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                      ),
                      Padding(
                        padding: getPadding(top: 25),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don’t have an account? ',
                                style: CustomTextStyles.bodyMediumThin_1,
                              ),
                              TextSpan(
                                text: 'Sign up',
                                style: CustomTextStyles.titleSmallTeal400_1,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: getHorizontalSize(142),
                    child: Divider(
                      height: getVerticalSize(4),
                      thickness: getVerticalSize(4),
                      color: appTheme.gray400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
