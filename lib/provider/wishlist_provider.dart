import 'dart:convert';
import 'dart:developer';

import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/book_model.dart';
import 'package:book/model/user_model.dart';
import 'package:book/repository/wishlist_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  List<BookModel> wishlist = [];
  AppStorage appStorage = AppStorage();

  List<int> get bookId => wishlist.map((e) => e.bookId!).toList();

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

  void addRemoveBookInWishlist(
    BookModel bookModel,
    int isWishlist,
  ) async {
    String token = await appStorage.getToken();
    if (isWishlist == 0) {
      wishlist = wishlist
          .where((element) => element.bookId != bookModel.bookId)
          .toList();
    } else {
      wishlist.add(bookModel);
    }
    notifyListeners();
    int userId = UserModel.fromJson(jsonDecode(await appStorage.getUser())).id!;
    Either<String, bool> result = await WishlistRepository.instance
        .addRemoveBookInWishlist(token, userId, bookModel.bookId!, isWishlist);
    result.fold((l) {
      log(l);
    }, (r) {
      if (r) {
      } else {
        if (isWishlist == 0) {
          wishlist.add(bookModel);
        } else {
          wishlist = wishlist
              .where((element) => element.bookId != bookModel.bookId)
              .toList();
        }
        notifyListeners();
      }
    });
  }
}
