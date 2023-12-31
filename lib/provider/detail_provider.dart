import 'dart:developer';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/core/storage/cache_storage.dart';
import 'package:book/presentation/detail_page_container_page/model/detail_model.dart';
import 'package:book/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class DetailProvider extends ChangeNotifier {
  DetailModel detailModel = DetailModel();
  AppStorage appStorage = AppStorage();
  bool isLoading = true;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getBookDetails(int bookId) async {
    String token = await appStorage.getToken();
    if (CacheStorage.bookRead.containsKey(bookId)) {
      detailModel = CacheStorage.bookRead[bookId]!;
      setLoading(false);
    } else {
      Either<String, DetailModel> result =
          await HomeRepository.instance.getBookDetails(bookId, token: token);
      result.fold((l) {
        log(l);
      }, (r) {
        detailModel = r;
        CacheStorage.bookRead[bookId] = r;
        setLoading(false);
      });
    }
  }
}
