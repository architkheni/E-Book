import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/book_model.dart';
import 'package:flutter/material.dart';

class ContinueReadingProvider extends ChangeNotifier {
  BookModel? bookModel;
  AppStorage appStorage = AppStorage();
  void setBook(BookModel? book) {
    bookModel = book;
    appStorage.setCurrentReadingBook(book);
    notifyListeners();
  }
}
