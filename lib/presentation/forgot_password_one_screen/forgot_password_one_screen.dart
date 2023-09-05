import 'package:book/core/app_export.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForgotPasswordOneScreen extends StatelessWidget {
  final String email;
  ForgotPasswordOneScreen({Key? key, required this.email})
      : super(
          key: key,
        );

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController newpasswordoneController = TextEditingController();

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
            height: mediaQueryData.size.height,
            width: double.maxFinite,
            padding: getPadding(
              left: 16,
              top: 176,
              right: 16,
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: getPadding(
                      top: 205,
                    ),
                    child: SizedBox(
                      width: getHorizontalSize(
                        142,
                      ),
                      child: Divider(
                        height: getVerticalSize(
                          4,
                        ),
                        thickness: getVerticalSize(
                          4,
                        ),
                        color: appTheme.gray400,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          left: 16,
                        ),
                        child: Text(
                          "Set Password",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          358,
                        ),
                        margin: getMargin(
                          top: 13,
                        ),
                        padding: getPadding(
                          left: 4,
                          top: 24,
                          right: 4,
                          bottom: 24,
                        ),
                        decoration: AppDecoration.fill.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgCheckmarkTeal400,
                              height: getSize(
                                53,
                              ),
                              width: getSize(
                                53,
                              ),
                              margin: getMargin(
                                top: 5,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 13,
                              ),
                              child: Text(
                                "Code verified",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            Container(
                              height: getVerticalSize(
                                199,
                              ),
                              width: getHorizontalSize(
                                338,
                              ),
                              margin: getMargin(
                                top: 23,
                              ),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomTextFormField(
                                          controller: newpasswordController,
                                          contentPadding: getPadding(
                                            left: 16,
                                            top: 15,
                                            bottom: 15,
                                          ),
                                          textStyle: CustomTextStyles
                                              .bodyMediumGray500,
                                          hintText: "Enter new password",
                                          hintStyle: CustomTextStyles
                                              .bodyMediumGray500,
                                          textInputAction: TextInputAction.next,
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          suffix: Container(
                                            margin: getMargin(
                                              left: 12,
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
                                        CustomTextFormField(
                                          controller: newpasswordoneController,
                                          margin: getMargin(
                                            top: 16,
                                          ),
                                          contentPadding: getPadding(
                                            left: 16,
                                            top: 15,
                                            bottom: 15,
                                          ),
                                          textStyle: CustomTextStyles
                                              .bodyMediumGray500,
                                          hintText: "Re-type new password",
                                          hintStyle: CustomTextStyles
                                              .bodyMediumGray500,
                                          textInputType:
                                              TextInputType.visiblePassword,
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
                                        Padding(
                                          padding: getPadding(
                                            top: 7,
                                          ),
                                          child: Text(
                                            "At-least 8 characters",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .bodySmallGray400,
                                          ),
                                        ),
                                        CustomElevatedButton(
                                          onTap: () {
                                            if (newpasswordController.text
                                                        .trim() !=
                                                    newpasswordController.text
                                                        .trim() ||
                                                newpasswordController.text
                                                    .trim()
                                                    .isEmpty) {
                                              SnackBar snackBar = SnackBar(
                                                content: Text(
                                                    "Please enter valid password"),
                                                backgroundColor:
                                                    appTheme.teal400,
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            } else {
                                              // TODO: update-password api
                                            }
                                          },
                                          width: double.maxFinite,
                                          height: getVerticalSize(
                                            48,
                                          ),
                                          text: "Set Password",
                                          margin: getMargin(
                                            top: 15,
                                          ),
                                          buttonStyle:
                                              CustomButtonStyles.fillTeal400,
                                          buttonTextStyle: CustomTextStyles
                                              .titleSmallPrimary_1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
}
