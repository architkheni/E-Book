import 'package:book/model/book_model.dart';
import 'package:book/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ViewAllBookProvider extends ChangeNotifier {
  bool isLoading = true;
  List<BookModel> books = [];

  Future<void> getViewAllBooks({required String param}) async {
    Either<String, List<BookModel>> result =
        await HomeRepository.instance.getViewAllBooks(param: param);
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
