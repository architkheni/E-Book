import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/language_model.dart';
import 'package:book/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  AppStorage appStorage = AppStorage();
  List<LanguageModel> language = [];
  void getAllLanguage() async {
    String token = await appStorage.getToken();
    Either<String, List<LanguageModel>> result =
        await HomeRepository.instance.getAllLanguage(token);
    result.fold((l) {}, (r) {
      language = r;
      notifyListeners();
    });
  }
}
