import 'package:book/core/app_export.dart';
import 'package:book/widgets/custom_elevated_button.dart';
import 'package:book/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../categories_screen/categories_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController UserNameController = TextEditingController();
  TextEditingController MobileNumberController = TextEditingController();

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
                      "Sign up",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                  Container(
                    margin: getMargin(top: 10, bottom: 5),
                    padding:
                        getPadding(left: 16, top: 22, right: 16, bottom: 22),
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
                          margin: getMargin(top: 21),
                          contentPadding: getPadding(
                              left: 16, top: 15, right: 16, bottom: 15),
                          textStyle: CustomTextStyles.bodyMediumGray500,
                          hintText: "Name",
                          hintStyle: CustomTextStyles.bodyMediumGray500,
                          textInputAction: TextInputAction.next,
                          filled: true,
                          fillColor: appTheme.blueGray50,
                        ),
                        CustomTextFormField(
                          controller: UserNameController,
                          margin: getMargin(top: 15),
                          contentPadding: getPadding(
                              left: 16, top: 15, right: 16, bottom: 15),
                          textStyle: CustomTextStyles.bodyMediumGray500,
                          hintText: "User Name",
                          hintStyle: CustomTextStyles.bodyMediumGray500,
                          textInputAction: TextInputAction.next,
                          filled: true,
                          fillColor: appTheme.blueGray50,
                        ),
                        CustomTextFormField(
                          controller: MobileNumberController,
                          margin: getMargin(top: 15),
                          contentPadding: getPadding(
                              left: 16, top: 15, right: 16, bottom: 15),
                          textStyle: CustomTextStyles.bodyMediumGray500,
                          hintText: "Mobile Number",
                          hintStyle: CustomTextStyles.bodyMediumGray500,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.phone,
                          maxLength: 10,
                          filled: true,
                          fillColor: appTheme.blueGray50,
                        ),
                        CustomTextFormField(
                          controller: emailController,
                          // margin: getMargin(top: 15),
                          contentPadding: getPadding(
                              left: 16, top: 15, right: 16, bottom: 15),
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
                          margin: getMargin(top: 16),
                          contentPadding:
                              getPadding(left: 16, top: 15, bottom: 15),
                          textStyle: CustomTextStyles.bodyMediumGray500,
                          hintText: "Password",
                          hintStyle: CustomTextStyles.bodyMediumGray500,
                          textInputType: TextInputType.visiblePassword,
                          suffix: Container(
                            margin: getMargin(
                                left: 30, top: 12, right: 16, bottom: 12),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgEye,
                            ),
                          ),
                          suffixConstraints: BoxConstraints(
                            maxHeight: getVerticalSize(48),
                          ),
                          obscureText: true,
                          filled: true,
                          fillColor: appTheme.blueGray50,
                        ),
                        Container(
                          width: getHorizontalSize(320),
                          margin: getMargin(top: 16, right: 5),
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
                          onTap: () {
                            var Name = validateName(nameController.text);
                            if (Name == "Name must be more than 2 charater") {
                              SnackBar snackBar = SnackBar(
                                content:
                                    Text("Name must be more than 2 charater"),
                                backgroundColor: appTheme.teal400,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              if (UserNameController.text == null ||
                                  UserNameController.text == "") {
                                SnackBar snackBar = SnackBar(
                                  content: Text("Enter User Name"),
                                  backgroundColor: appTheme.teal400,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                var number =
                                    validateMobile(MobileNumberController.text);
                                if (number ==
                                    "Mobile Number must be of 10 digit") {
                                  SnackBar snackBar = SnackBar(
                                    content: Text(
                                        "Mobile Number must be of 10 digit"),
                                    backgroundColor: appTheme.teal400,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  var velidEmail = emailV(emailController.text);
                                  if (velidEmail == false) {
                                    SnackBar snackBar = SnackBar(
                                      content: Text(
                                          "Please enter a valid email address"),
                                      backgroundColor: appTheme.teal400,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoriesScreen()),
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
                              child: Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    "Already have an account? ",
                                    style: CustomTextStyles.bodyMediumThin_1,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Log in",
                                      style:
                                          CustomTextStyles.titleSmallTeal400_1,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              )),
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

  emailV(String Email) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(Email);
    print(emailValid);
    return emailValid;
  }

  validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }
}
