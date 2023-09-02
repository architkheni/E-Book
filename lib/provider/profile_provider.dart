import 'dart:convert';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/user_model.dart';
import 'package:flutter/material.dart';

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
}
