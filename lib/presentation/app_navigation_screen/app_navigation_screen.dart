import 'package:book/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary.withOpacity(1),
        body: SizedBox(
          width: getHorizontalSize(375),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: AppDecoration.fill5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(
                          left: 20,
                          top: 10,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Text(
                          'App Navigation',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appTheme.black900,
                            fontSize: getFontSize(20),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(left: 20),
                        child: Text(
                          "Check your app's UI from the below demo screens of your app.",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appTheme.blueGray400,
                            fontSize: getFontSize(16),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(top: 5),
                      child: Divider(
                        height: getVerticalSize(1),
                        thickness: getVerticalSize(1),
                        color: appTheme.black900,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: AppDecoration.fill5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            onTapLoginEmail(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fill5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'Log in (Email)',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 5,
                                  ),
                                  child: Divider(
                                    height: getVerticalSize(
                                      1,
                                    ),
                                    thickness: getVerticalSize(
                                      1,
                                    ),
                                    color: appTheme.blueGray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapForgotPasswordTwo(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fill5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'Forgot Password Two',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 5,
                                  ),
                                  child: Divider(
                                    height: getVerticalSize(
                                      1,
                                    ),
                                    thickness: getVerticalSize(
                                      1,
                                    ),
                                    color: appTheme.blueGray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapSignup(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fill5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'Sign up',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 5,
                                  ),
                                  child: Divider(
                                    height: getVerticalSize(
                                      1,
                                    ),
                                    thickness: getVerticalSize(
                                      1,
                                    ),
                                    color: appTheme.blueGray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapCategories(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fill5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'Categories',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 5,
                                  ),
                                  child: Divider(
                                    height: getVerticalSize(
                                      1,
                                    ),
                                    thickness: getVerticalSize(
                                      1,
                                    ),
                                    color: appTheme.blueGray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapHomeScreenContainer(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fill5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'Home Screen - Container',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 5,
                                  ),
                                  child: Divider(
                                    height: getVerticalSize(
                                      1,
                                    ),
                                    thickness: getVerticalSize(
                                      1,
                                    ),
                                    color: appTheme.blueGray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapLoginPassword(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fill5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'Log in (Password)',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 5,
                                  ),
                                  child: Divider(
                                    height: getVerticalSize(
                                      1,
                                    ),
                                    thickness: getVerticalSize(
                                      1,
                                    ),
                                    color: appTheme.blueGray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapForgotPassword(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fill5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'Forgot Password',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 5,
                                  ),
                                  child: Divider(
                                    height: getVerticalSize(
                                      1,
                                    ),
                                    thickness: getVerticalSize(
                                      1,
                                    ),
                                    color: appTheme.blueGray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapLangugaes(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fill5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'Langugaes',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 5,
                                  ),
                                  child: Divider(
                                    height: getVerticalSize(
                                      1,
                                    ),
                                    thickness: getVerticalSize(
                                      1,
                                    ),
                                    color: appTheme.blueGray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapHomeRecommendedforyouSeeAll(
                              context,
                            );
                          },
                          child: Container(
                            decoration: AppDecoration.fill5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'home > Recommended for you > See All',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 5,
                                  ),
                                  child: Divider(
                                    height: getVerticalSize(
                                      1,
                                    ),
                                    thickness: getVerticalSize(
                                      1,
                                    ),
                                    color: appTheme.blueGray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapForgotPasswordOne(context);
                          },
                          child: Container(
                            decoration: AppDecoration.fill5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'Forgot Password One',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: getFontSize(20),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(top: 5),
                                  child: Divider(
                                    height: getVerticalSize(1),
                                    thickness: getVerticalSize(1),
                                    color: appTheme.blueGray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapHomeRecommendedforyouSeeAllOne(
                              context,
                            );
                          },
                          child: Container(
                            decoration: AppDecoration.fill5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'home > Recommended for you > See All One',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 5,
                                  ),
                                  child: Divider(
                                    height: getVerticalSize(
                                      1,
                                    ),
                                    thickness: getVerticalSize(
                                      1,
                                    ),
                                    color: appTheme.blueGray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the logInEmailScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the logInEmailScreen.
  onTapLoginEmail(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.logInEmailScreen);
  }

  /// Navigates to the forgotPasswordTwoScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the forgotPasswordTwoScreen.
  onTapForgotPasswordTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordTwoScreen);
  }

  /// Navigates to the signUpScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the signUpScreen.
  onTapSignup(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }

  /// Navigates to the categoriesScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the categoriesScreen.
  onTapCategories(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.categoriesScreen);
  }

  /// Navigates to the homeScreenContainerScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the homeScreenContainerScreen.
  onTapHomeScreenContainer(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreenContainerScreen);
  }

  /// Navigates to the logInPasswordScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the logInPasswordScreen.
  onTapLoginPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.logInPasswordScreen);
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the forgotPasswordScreen.
  onTapForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }

  /// Navigates to the langugaesScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the langugaesScreen.
  onTapLangugaes(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.langugaesScreen);
  }

  /// Navigates to the homeRecommendedForYouSeeAllScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the homeRecommendedForYouSeeAllScreen.
  onTapHomeRecommendedforyouSeeAll(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeRecommendedForYouSeeAllScreen);
  }

  /// Navigates to the forgotPasswordOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the forgotPasswordOneScreen.
  onTapForgotPasswordOne(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordOneScreen);
  }

  /// Navigates to the homeRecommendedForYouSeeAllOneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the `Navigator` widget
  /// to push the named route for the homeRecommendedForYouSeeAllOneScreen.
  onTapHomeRecommendedforyouSeeAllOne(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.homeRecommendedForYouSeeAllOneScreen,
    );
  }
}
