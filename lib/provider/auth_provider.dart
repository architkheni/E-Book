import 'package:book/core/storage/app_storage.dart';
import 'package:book/core/utils/color_constant.dart';
import 'package:book/model/member_ship_model.dart';
import 'package:book/model/user_model.dart';
import 'package:book/repository/auth_repository.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/widgets/screen_loader.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/app_export.dart';

class AuthProvider extends ChangeNotifier {
  AppStorage appStorage = AppStorage();
  ScreenLoader screenLoader = ScreenLoader();

  void logIn(
    BuildContext context, {
    required String email,
    String? password,
  }) async {
    screenLoader.show(
      context,
      loadingColor: ColorConstant.primaryColor,
      containerColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      backgroundColor: Colors.black12,
    );
    Either<String, Map<String, dynamic>> result =
        await AuthRepository.instance.logIn(email: email, password: password);
    screenLoader.hide();
    result.fold((l) {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      googleSignIn.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
          backgroundColor: appTheme.teal400,
        ),
      );
    }, (r) async {
      GoRouter navigator = GoRouter.of(context);
      appStorage.setToken((r['data'] as UserModel).apiToken!);
      appStorage.setUser((r['data'] as UserModel).toString());
      if (r['membership_details'] != null) {
        appStorage.setPackage(
          (r['membership_details'] as MembershipModel).toString(),
        );
      }
      appStorage.setLogin(true);
      // bool isFirst = await appStorage.getCategoryIsFirst();
      // if (isFirst) {
      // navigator.push(AppRoutesPath.category);
      // } else {
      navigator.go(AppRoutesPath.home);
      // }
    });
  }

  void register(
    BuildContext context, {
    required String name,
    required String username,
    required String mobileNo,
    required String email,
    required String password,
  }) async {
    screenLoader.show(
      context,
      loadingColor: ColorConstant.primaryColor,
      containerColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      backgroundColor: Colors.black12,
    );
    Either<String, UserModel> result = await AuthRepository.instance.register(
      name: name,
      username: username,
      mobileNo: mobileNo,
      email: email,
      password: password,
    );
    screenLoader.hide();
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
          backgroundColor: appTheme.teal400,
        ),
      );
    }, (r) {
      appStorage.setToken(r.apiToken!);
      appStorage.setUser(r.toString());
      appStorage.setLogin(true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('user has been save successfully'),
          backgroundColor: appTheme.teal400,
        ),
      );
      context.push(AppRoutesPath.category);
    });
  }

  void ssoCreate(
    BuildContext context, {
    required String email,
  }) async {
    screenLoader.show(
      context,
      loadingColor: ColorConstant.primaryColor,
      containerColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      backgroundColor: Colors.black12,
    );
    Either<String, UserModel> result = await AuthRepository.instance.ssoCreate(
      email: email,
    );
    screenLoader.hide();
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
          backgroundColor: appTheme.teal400,
        ),
      );
    }, (r) {
      appStorage.setToken(r.apiToken!);
      appStorage.setUser(r.toString());
      appStorage.setLogin(true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('user has been save successfully'),
          backgroundColor: appTheme.teal400,
        ),
      );
      context.go(AppRoutesPath.home);
    });
  }

  void forgotPassword(BuildContext context, {required String email}) async {
    Either<String, bool> result =
        await AuthRepository.instance.forgotPassword(email: email);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
          backgroundColor: appTheme.teal400,
        ),
      );
    }, (r) {
      context.push(AppRoutesPath.forgotPassword, extra: email);
    });
  }

  void resendOtp(BuildContext context, {required String email}) async {
    Either<String, String> result =
        await AuthRepository.instance.resendOtp(email: email);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
          backgroundColor: appTheme.teal400,
        ),
      );
    }, (r) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(r),
          backgroundColor: appTheme.teal400,
        ),
      );
    });
  }

  void verifyOtp(
    BuildContext context, {
    required String email,
    required String code,
  }) async {
    Either<String, bool> result =
        await AuthRepository.instance.verifyToken(email: email, code: code);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
          backgroundColor: appTheme.teal400,
        ),
      );
    }, (r) {
      context.push(AppRoutesPath.forgotPasswordOne, extra: email);
    });
  }

  void updatePassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    screenLoader.show(
      context,
      loadingColor: ColorConstant.primaryColor,
      containerColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      backgroundColor: Colors.black12,
    );
    Either<String, bool> result = await AuthRepository.instance
        .updatePassword(email: email, password: password);
    screenLoader.hide();
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
          backgroundColor: appTheme.teal400,
        ),
      );
    }, (r) {
      context.push(AppRoutesPath.logInEmail);
    });
  }

  void logout(BuildContext context) async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Are you sure to logout?'),
        actions: [
          TextButton(
            onPressed: () async {
              String token = await appStorage.getToken();
              Either<String, bool> result =
                  await AuthRepository.instance.logout(token: token);
              result.fold((l) {
                SnackBar snackBar = SnackBar(
                  content: Text(l),
                  backgroundColor: appTheme.teal400,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }, (r) {
                Navigator.pop(context);
                AppStorage appStorage = AppStorage();
                appStorage.dispose(context);
                context.go(AppRoutesPath.logInEmail);
                final GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.signOut();
              });
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                ColorConstant.primaryColor.withOpacity(0.10),
              ),
            ),
            child: Text(
              'Yes',
              style: TextStyle(color: appTheme.teal400),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                ColorConstant.primaryColor.withOpacity(0.10),
              ),
            ),
            child: Text(
              'No',
              style: TextStyle(color: appTheme.teal400),
            ),
          ),
        ],
      ),
    );
  }

  void changePassword(
    BuildContext context, {
    required String currentPassword,
    required String newPassword,
  }) async {
    String token = await appStorage.getToken();
    Either<String, bool> result = await AuthRepository.instance.changePassword(
      token: token,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
          backgroundColor: appTheme.teal400,
        ),
      );
    }, (r) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Password change successfully'),
          backgroundColor: appTheme.teal400,
        ),
      );
      context.pop();
    });
  }
}
