import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/user_model.dart';
import 'package:book/presentation/categories_screen/categories_screen.dart';
import 'package:book/presentation/forgot_password_one_screen/forgot_password_one_screen.dart';
import 'package:book/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:book/presentation/log_in_email_screen/log_in_email_screen.dart';
import 'package:book/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../core/app_export.dart';

class AuthProvider extends ChangeNotifier {
  AppStorage appStorage = AppStorage();

  void logIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    Either<String, UserModel> result =
        await AuthRepository.instance.logIn(email: email, password: password);
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CategoriesScreen()),
      );
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
    Either<String, UserModel> result = await AuthRepository.instance.register(
      name: name,
      username: username,
      mobileNo: mobileNo,
      email: email,
      password: password,
    );
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CategoriesScreen()),
      );
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ForgotPasswordScreen(
            email: email,
          ),
        ),
      );
    });
  }

  void resendOtp(BuildContext context, {required String email}) async {
    Either<String, bool> result =
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
          content: const Text('otp sent successfully'),
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ForgotPasswordOneScreen(
            email: email,
          ),
        ),
      );
    });
  }

  void updatePassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    Either<String, bool> result = await AuthRepository.instance
        .updatePassword(email: email, password: password);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l),
          backgroundColor: appTheme.teal400,
        ),
      );
    }, (r) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LogInEmailScreen(),
        ),
      );
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
                NavigatorState navigatorState = Navigator.of(context);
                AppStorage appStorage = AppStorage();
                appStorage.dispose();
                navigatorState.pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LogInEmailScreen(),
                  ),
                  (route) => false,
                );
              });
            },
            child: Text(
              'Yes 👍',
              style: TextStyle(color: appTheme.teal400),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'No 👎',
              style: TextStyle(color: appTheme.teal400),
            ),
          ),
        ],
      ),
    );
  }
}
