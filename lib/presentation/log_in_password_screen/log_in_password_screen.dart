import 'package:book/core/app_export.dart';
import 'package:book/provider/auth_provider.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LogInPasswordScreen extends StatefulWidget {
  const LogInPasswordScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<LogInPasswordScreen> createState() => _LogInPasswordScreenState();
}

class _LogInPasswordScreenState extends State<LogInPasswordScreen> {
  bool isCheckbox = false;
  bool obsecure = true;

  TextEditingController passwordController = TextEditingController();

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
              onTapArrowleft1(context);
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
            padding: getPadding(left: 16, top: 146, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(left: 16),
                  child: Text(
                    'Log in',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
                Container(
                  margin: getMargin(top: 15, bottom: 5),
                  padding: getPadding(
                    left: 16,
                    top: 23,
                    right: 16,
                    bottom: 23,
                  ),
                  decoration: AppDecoration.fill.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getVerticalSize(70),
                        width: getHorizontalSize(326),
                        child: Row(
                          // alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: getVerticalSize(70),
                              width: getHorizontalSize(70),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  35,
                                ),
                                child: CustomImageView(
                                  imagePath: ImageConstant.profile,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'John Doe',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.titleMediumBold,
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 3,
                                    ),
                                    child: Text(
                                      widget.email,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.bodyMediumGray400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: CustomImageView(
                                fit: BoxFit.fill,
                                imagePath: ImageConstant.checkBox,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        margin: getMargin(top: 24),
                        contentPadding: getPadding(
                          left: 16,
                          top: 15,
                          bottom: 15,
                        ),
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
                        suffixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(48),
                        ),
                        obscureText: obsecure,
                        filled: true,
                        fillColor: appTheme.blueGray50,
                      ),
                      CustomElevatedButton(
                        onTap: () {
                          context.read<AuthProvider>().logIn(
                                context,
                                email: widget.email,
                                password: passwordController.text.trim(),
                              );
                        },
                        width: double.maxFinite,
                        height: getVerticalSize(48),
                        text: 'Continue',
                        margin: getMargin(top: 16),
                        buttonStyle: CustomButtonStyles.fillTeal400,
                        buttonTextStyle: CustomTextStyles.titleSmallPrimary_1,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AuthProvider>().forgotPassword(
                                context,
                                email: widget.email,
                              );
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

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft1(BuildContext context) {
    context.pop();
  }
}
