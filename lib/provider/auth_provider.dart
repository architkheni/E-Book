import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/user_model.dart';
import 'package:book/presentation/categories_screen/categories_screen.dart';
import 'package:book/presentation/forgot_password_screen/forgot_password_screen.dart';
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l)));
    }, (r) {
      appStorage.setToken(r.apiToken!);
      appStorage.setUser(r.toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoriesScreen()),
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(l),
        backgroundColor: appTheme.teal400,
      ));
    }, (r) {
      appStorage.setToken(r.apiToken!);
      appStorage.setUser(r.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("user has been save successfully"),
        backgroundColor: appTheme.teal400,
      ));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoriesScreen()),
      );
    });
  }

  void forgotPassword(BuildContext context, {required String email}) async {
    Either<String, bool> result =
        await AuthRepository.instance.forgotPassword(email: email);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(l),
        backgroundColor: appTheme.teal400,
      ));
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(l),
        backgroundColor: appTheme.teal400,
      ));
    }, (r) {});
  }
}