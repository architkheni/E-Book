import 'dart:convert';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/user_model.dart';
import 'package:book/presentation/langugaes_screen/langugaes_screen.dart';
import 'package:book/repository/profile_repository.dart';
import 'package:book/theme/theme_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../presentation/custom_bottom_bar/custom_bottom_bar.dart';

class ProfileProvider extends ChangeNotifier {
  AppStorage appStorage = AppStorage();
  String username = '';
  String email = '';
  String? uploadImage;

  void init() async {
    String data = await appStorage.getUser();
    UserModel userModel = UserModel.fromJson(jsonDecode(data));
    username = userModel.username!;
    email = userModel.email!;
    uploadImage = userModel.image;
    notifyListeners();
  }

  void saveUserCategory(BuildContext context,
      {required List<int> category, void Function()? onSuccess,}) async {
    String token = await appStorage.getToken();
    Either<String, bool> result = await ProfileRepository.instance
        .saveUserCategory(token: token, category: category);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l)));
    }, (r) {
      if (onSuccess != null) {
        onSuccess();
        return;
      }
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LangugaesScreen(),
      ),);
    });
  }

  void saveUserLanguage(BuildContext context,
      {required List<int> language, void Function()? onSuccess,}) async {
    String token = await appStorage.getToken();
    Either<String, bool> result = await ProfileRepository.instance
        .saveUserLanguage(token: token, languages: language);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l)));
    }, (r) {
      if (onSuccess != null) {
        onSuccess();
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottombarPage(buttomIndex: 0)),
      );
    });
  }

  void saveUserDetails(
    BuildContext context, {
    required String name,
    required String username,
    required String contactNumber,
    String? path,
  }) async {
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
      NavigatorState navigator = Navigator.of(context);
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
    }, (r) async {
      SnackBar snackBar = SnackBar(
        content: Text(r),
        backgroundColor: appTheme.teal400,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    });
  }
}
