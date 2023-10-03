import 'package:book/core/utils/color_constant.dart';
import 'package:book/core/utils/image_constant.dart';
import 'package:book/core/utils/size_utils.dart';
import 'package:book/provider/auth_provider.dart';
import 'package:book/theme/custom_button_style.dart';
import 'package:book/theme/custom_text_style.dart';
import 'package:book/theme/theme_helper.dart';
import 'package:book/widgets/app_bar/appbar_image.dart';
import 'package:book/widgets/app_bar/appbar_subtitle.dart';
import 'package:book/widgets/app_bar/custom_app_bar.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newConfirmPasswordController = TextEditingController();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    newConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        height: 60,
        leadingWidth: 35,
        leading: AppbarImage(
          height: 20,
          width: 15,
          svgPath: ImageConstant.imgArrowleftBlueGray50,
          margin: getMargin(left: 16, top: 17, bottom: 18),
          onTap: () {
            Navigator.pop(context);
          },
          color: isLight ? ColorConstant.black : null,
        ),
        title: Padding(
          padding: getPadding(left: 11),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: appTheme.teal400,
                  width: 2,
                ),
              ),
            ),
            padding: const EdgeInsets.only(bottom: 3),
            child: AppbarSubtitle(
              text: 'Change Password',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Enter your current password',
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleMediumWhiteA500.copyWith(
                color: isLight ? ColorConstant.black : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 30),
              child: CustomTextFormField(
                controller: currentPasswordController,
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
                hintText: 'Enter current password',
                hintStyle: CustomTextStyles.bodyMediumGray200,
                textInputType: TextInputType.name,
                filled: true,
                fillColor:
                    isLight ? ColorConstant.kF3F3F3 : appTheme.grayTextfiled,
              ),
            ),
            Text(
              'Enter new password',
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleMediumWhiteA500.copyWith(
                color: isLight ? ColorConstant.black : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 30),
              child: CustomTextFormField(
                controller: newPasswordController,
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
                hintText: 'Enter new password',
                hintStyle: CustomTextStyles.bodyMediumGray200,
                textInputType: TextInputType.name,
                filled: true,
                fillColor:
                    isLight ? ColorConstant.kF3F3F3 : appTheme.grayTextfiled,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Re-type new password',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.titleMediumWhiteA500.copyWith(
                  color: isLight ? ColorConstant.black : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 30),
              child: CustomTextFormField(
                controller: newConfirmPasswordController,
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
                hintText: 'Re-type new password',
                hintStyle: CustomTextStyles.bodyMediumGray200,
                textInputType: TextInputType.name,
                filled: true,
                fillColor:
                    isLight ? ColorConstant.kF3F3F3 : appTheme.grayTextfiled,
              ),
            ),
            CustomElevatedButton(
              onTap: () {
                if (currentPasswordController.text.trim().isEmpty) {
                  SnackBar snackBar = SnackBar(
                    content: const Text('Current password is not empty'),
                    backgroundColor: appTheme.teal400,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                if (newPasswordController.text.trim().isEmpty) {
                  SnackBar snackBar = SnackBar(
                    content: const Text('New password is not empty'),
                    backgroundColor: appTheme.teal400,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                if (newPasswordController.text.trim().length < 8) {
                  SnackBar snackBar = SnackBar(
                    content: const Text(
                      'Password length must be greater than 8 characters',
                    ),
                    backgroundColor: appTheme.teal400,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                if (newPasswordController.text.trim().contains(' ')) {
                  SnackBar snackBar = SnackBar(
                    content: const Text(
                      'Password not contain space',
                    ),
                    backgroundColor: appTheme.teal400,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                if (newPasswordController.text.trim() !=
                    newConfirmPasswordController.text.trim()) {
                  SnackBar snackBar = SnackBar(
                    content: const Text('Confirm password is not same'),
                    backgroundColor: appTheme.teal400,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                context.read<AuthProvider>().changePassword(
                      context,
                      currentPassword: currentPasswordController.text.trim(),
                      newPassword: newPasswordController.text.trim(),
                    );
              },
              width: double.maxFinite,
              height: getVerticalSize(48),
              text: 'Change Password',
              buttonStyle: CustomButtonStyles.fillTeal400,
              buttonTextStyle: CustomTextStyles.titleSmallPrimary_1.copyWith(
                color: isLight ? ColorConstant.whiteA700 : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
