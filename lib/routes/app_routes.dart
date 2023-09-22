import 'package:book/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:book/presentation/categories_screen/categories_screen.dart';
import 'package:book/presentation/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:book/presentation/forgot_password_one_screen/forgot_password_one_screen.dart';
import 'package:book/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:book/presentation/forgot_password_two_screen/forgot_password_two_screen.dart';
import 'package:book/presentation/home_recommended_for_you_see_all_one_screen/home_recommended_for_you_see_all_one_screen.dart';
import 'package:book/presentation/home_screen_container_screen/home_screen_container_screen.dart';
import 'package:book/presentation/langugaes_screen/langugaes_screen.dart';
import 'package:book/presentation/log_in_email_screen/log_in_email_screen.dart';
import 'package:book/presentation/log_in_password_screen/log_in_password_screen.dart';
import 'package:book/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String logInEmailScreen = '/log_in_email_screen';

  static const String forgotPasswordTwoScreen = '/forgot_password_two_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String categoriesScreen = '/categories_screen';

  static const String homeScreenPage = '/home_screen_page';

  static const String homeScreenContainerScreen =
      '/home_screen_container_screen';

  static const String logInPasswordScreen = '/log_in_password_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String langugaesScreen = '/langugaes_screen';

  static const String homeRecommendedForYouSeeAllScreen =
      '/home_recommended_for_you_see_all_screen';

  static const String forgotPasswordOneScreen = '/forgot_password_one_screen';

  static const String homeRecommendedForYouSeeAllOneScreen =
      '/home_recommended_for_you_see_all_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String bottomPage = '/bottom-page';

  static Map<String, WidgetBuilder> routes = {
    logInEmailScreen: (context) => const LogInEmailScreen(),
    forgotPasswordTwoScreen: (context) => ForgotPasswordTwoScreen(),
    signUpScreen: (context) => const SignUpScreen(),
    categoriesScreen: (context) => const CategoriesScreen(),
    homeScreenContainerScreen: (context) => HomeScreenContainerScreen(),
    logInPasswordScreen: (context) => const LogInPasswordScreen(
          email: '',
        ),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(
          email: '',
        ),
    langugaesScreen: (context) => const LangugaesScreen(),
    // TODO: comment becase flag is not come
    // homeRecommendedForYouSeeAllScreen: (context) =>
    //     HomeRecommendedForYouSeeAllScreen(
    //       title: '',
    //       books: [],
    //     ),
    forgotPasswordOneScreen: (context) =>
        const ForgotPasswordOneScreen(email: ''),
    homeRecommendedForYouSeeAllOneScreen: (context) =>
        HomeRecommendedForYouSeeAllOneScreen(),
    appNavigationScreen: (context) => const AppNavigationScreen(),
    bottomPage: (context) => BottombarPage(
          buttomIndex: 0,
        ),
  };
}
