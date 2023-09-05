
import 'dart:developer';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/book_model.dart';
import 'package:book/repository/wishlist_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  List<BookModel> wishlist = [];
  AppStorage appStorage = AppStorage();

  void getWishListBook() async {
    String token = await appStorage.getToken();
    Either<String, List<BookModel>> result =
        await WishlistRepository.instance.getWishlistBook(token);
    result.fold((l) {
      log(l);
    }, (r) {
      wishlist = r;
      notifyListeners();
    });
  }
}
