import 'dart:convert';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/user_model.dart';
import 'package:book/presentation/langugaes_screen/langugaes_screen.dart';
import 'package:book/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../presentation/custom_bottom_bar/custom_bottom_bar.dart';

class ProfileProvider extends ChangeNotifier {
  AppStorage appStorage = AppStorage();
  String username = "";
  String email = "";

  void init() async {
    String data = await appStorage.getUser();
    UserModel userModel = UserModel.fromJson(jsonDecode(data));
    username = userModel.username!;
    email = userModel.email!;
    notifyListeners();
  }

  void saveUserCategory(BuildContext context,
      {required List<int> category}) async {
    String token = await appStorage.getToken();
    Either<String, bool> result = await ProfileRepository.instance
        .saveUserCategory(token: token, category: category);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l)));
    }, (r) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LangugaesScreen(),
      ));
    });
  }

  void saveUserLanguage(BuildContext context,
      {required List<int> language}) async {
    String token = await appStorage.getToken();
    Either<String, bool> result = await ProfileRepository.instance
        .saveUserLanguage(token: token, languages: language);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l)));
    }, (r) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottombarPage(buttomIndex: 0)),
      );
    });
  }
}
