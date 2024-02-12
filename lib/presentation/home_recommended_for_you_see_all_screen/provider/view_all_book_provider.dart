import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/book_model.dart';
import 'package:book/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ViewAllBookProvider extends ChangeNotifier {
  AppStorage appStorage = AppStorage();
  bool isLoading = true;
  List<BookModel> books = [];

  Future<void> getViewAllBooks({required String param, String? key}) async {
    String token = await appStorage.getToken();
    Either<String, List<BookModel>> result = await HomeRepository.instance
        .getViewAllBooks(param: param, token: token, key: key ?? 'book_detail');
    result.fold((l) {
      setLoading(false);
    }, (r) {
      books = r;
      setLoading(false);
    });
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
