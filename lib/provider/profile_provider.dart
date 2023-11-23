import 'dart:convert';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/user_model.dart';
import 'package:book/repository/profile_repository.dart';
import 'package:book/router/app_routes.dart';
import 'package:book/theme/theme_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileProvider extends ChangeNotifier {
  AppStorage appStorage = AppStorage();
  String username = '';
  String email = '';
  String uploadImage = '';

  void init() async {
    String data = await appStorage.getUser();
    UserModel userModel = UserModel.fromJson(jsonDecode(data));
    username = userModel.username!;
    email = userModel.email!;
    uploadImage = userModel.image ?? '';
    notifyListeners();
  }

  void saveUserCategory(
    BuildContext context, {
    required List<int> category,
    void Function()? onSuccess,
  }) async {
    GoRouter navigator = GoRouter.of(context);
    String token = await appStorage.getToken();
    Either<String, bool> result = await ProfileRepository.instance
        .saveUserCategory(token: token, category: category);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l)));
    }, (r) async {
      String data = await appStorage.getUser();
      UserModel userModel = UserModel.fromJson(jsonDecode(data));
      userModel.categories = category;
      appStorage.setUser(jsonEncode(userModel));
      if (onSuccess != null) {
        onSuccess();
        return;
      }
      navigator.push(AppRoutesPath.language);
    });
  }

  void saveUserLanguage(
    BuildContext context, {
    required List<int> language,
    void Function()? onSuccess,
  }) async {
    GoRouter navigator = GoRouter.of(context);
    String token = await appStorage.getToken();
    Either<String, bool> result = await ProfileRepository.instance
        .saveUserLanguage(token: token, languages: language);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l)));
    }, (r) async {
      String data = await appStorage.getUser();
      UserModel userModel = UserModel.fromJson(jsonDecode(data));
      userModel.languages = language;
      appStorage.setUser(jsonEncode(userModel));
      appStorage.setCategoryIsFirst(false);
      if (onSuccess != null) {
        onSuccess();
        return;
      }
      navigator.go(AppRoutesPath.home);
    });
  }

  void saveUserDetails(
    BuildContext context, {
    required String name,
    required String username,
    required String contactNumber,
    String? path,
  }) async {
    GoRouter navigator = GoRouter.of(context);
    String token = await appStorage.getToken();
    Either<String, UserModel> result =
        await ProfileRepository.instance.saveUserProfile(
      token: token,
      name: name,
      username: username,
      contactNumber: contactNumber,
      path: path,
    );
    result.fold((l) {
      SnackBar snackBar = SnackBar(
        content: Text(l),
        backgroundColor: appTheme.teal400,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }, (r) async {
      SnackBar snackBar = SnackBar(
        content: const Text('User profile has been updated successfully'),
        backgroundColor: appTheme.teal400,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      await appStorage.setUser(r.toString());
      init();
      navigator.pop();
    });
  }

  void contactUs(
    BuildContext context, {
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    Either<String, String> result = await ProfileRepository.instance.contactUs(
      name: name,
      email: email,
      subject: subject,
      message: message,
    );
    result.fold((l) {
      SnackBar snackBar = SnackBar(
        content: Text(l),
        backgroundColor: appTheme.teal400,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }, (r) {
      SnackBar snackBar = SnackBar(
        content: Text(r),
        backgroundColor: appTheme.teal400,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      context.pop();
    });
  }

  void saveTransaction(
    BuildContext context, {
    required String transactionId,
    required String status,
    required String type,
    required int packageId,
    required String packageType,
  }) async {
    String token = await appStorage.getToken();
    Either<String, Map<String, dynamic>> result =
        await ProfileRepository.instance.saveTransaction(
      token: token,
      transactionId: transactionId,
      status: status,
      type: type,
      packageId: packageId,
      packageType: packageType,
    );
    result.fold((l) {
      SnackBar snackBar = SnackBar(
        content: Text(l),
        backgroundColor: appTheme.teal400,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }, (r) {
      SnackBar snackBar = SnackBar(
        content: Text(r['message']),
        backgroundColor: appTheme.teal400,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      context.pop();
    });
  }
}
