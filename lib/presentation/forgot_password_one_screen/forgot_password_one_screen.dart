import 'package:book/core/app_export.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/provider/auth_provider.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ForgotPasswordOneScreen extends StatefulWidget {
  final String email;
  const ForgotPasswordOneScreen({Key? key, required this.email})
      : super(
          key: key,
        );

  @override
  State<ForgotPasswordOneScreen> createState() =>
      _ForgotPasswordOneScreenState();
}

class _ForgotPasswordOneScreenState extends State<ForgotPasswordOneScreen> {
  bool obsecure = true;

  bool reObsecure = true;

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController newpasswordoneController = TextEditingController();

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
                          'Reset Password',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: isLight
                              ? theme.textTheme.headlineLarge!
                                  .copyWith(color: Colors.black)
                              : theme.textTheme.headlineLarge,
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
                          color: isLight ? ColorConstant.kF3F3F3 : null,
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
                                'Code verified',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color: isLight ? ColorConstant.black : null,
                                ),
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
                                          hintText: 'Enter new password',
                                          hintStyle: CustomTextStyles
                                              .bodyMediumGray500,
                                          textInputAction: TextInputAction.next,
                                          textInputType:
                                              TextInputType.visiblePassword,
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
                                            color: appTheme.gray500,
                                          ),
                                          suffixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(
                                              48,
                                            ),
                                          ),
                                          obscureText: obsecure,
                                          filled: true,
                                          fillColor: isLight
                                              ? ColorConstant.kE1E1E1
                                              : appTheme.blueGray50,
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
                                          hintText: 'Re-type new password',
                                          hintStyle: CustomTextStyles
                                              .bodyMediumGray500,
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          suffix: IconButton(
                                            splashColor: Colors.transparent,
                                            iconSize: 23,
                                            onPressed: () {
                                              setState(() {
                                                reObsecure = !reObsecure;
                                              });
                                            },
                                            icon: Icon(
                                              reObsecure
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                            ),
                                            color: appTheme.gray500,
                                          ),
                                          suffixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(
                                              48,
                                            ),
                                          ),
                                          obscureText: reObsecure,
                                          filled: true,
                                          fillColor: isLight
                                              ? ColorConstant.kE1E1E1
                                              : appTheme.blueGray50,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 7,
                                          ),
                                          child: Text(
                                            'At-least 8 characters',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .bodySmallGray400
                                                .copyWith(
                                              color: isLight
                                                  ? ColorConstant.black
                                                  : null,
                                            ),
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
                                                content: const Text(
                                                  'Please enter valid password',
                                                ),
                                                backgroundColor:
                                                    appTheme.teal400,
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            } else {
                                              context
                                                  .read<AuthProvider>()
                                                  .updatePassword(
                                                    context,
                                                    email: widget.email,
                                                    password:
                                                        newpasswordController
                                                            .text,
                                                  );
                                            }
                                          },
                                          width: double.maxFinite,
                                          height: getVerticalSize(
                                            48,
                                          ),
                                          text: 'Reset Password',
                                          margin: getMargin(
                                            top: 15,
                                          ),
                                          buttonStyle:
                                              CustomButtonStyles.fillTeal400,
                                          buttonTextStyle: CustomTextStyles
                                              .titleSmallPrimary_1
                                              .copyWith(
                                            color: isLight
                                                ? ColorConstant.whiteA700
                                                : null,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
