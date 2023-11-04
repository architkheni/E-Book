import 'package:book/core/storage/cache_storage.dart';
import 'package:book/model/book_chapter_model.dart';
import 'package:book/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class BookReadProvider extends ChangeNotifier {
  List<BookChapterModel> chapters = [];
  bool isLoading = true;

  void getChapter(int bookId) async {
    if (CacheStorage.bookChapters.containsKey(bookId)) {
      chapters = CacheStorage.bookChapters[bookId]!;
      setLoading(false);
    } else {
      Either<String, List<BookChapterModel>> result =
          await HomeRepository.instance.getBookChapter(bookId);
      result.fold((l) {
        setLoading(false);
      }, (r) {
        chapters = r;
        CacheStorage.bookChapters[bookId] = r;
        setLoading(false);
      });
    }
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
