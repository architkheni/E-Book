import 'package:book/model/book_model.dart';
import 'package:book/model/category_model.dart';
import 'package:book/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class HomePovider extends ChangeNotifier {
  bool isLoading = false;
  List<BookModel> popularBook = [];
  List<BookModel> topSearchBook = [];
  List<BookModel> recommendedBook = [];
  List<BookModel> topSellBook = [];
  List<BookModel> recentlyAddBook = [];
  List<CategoryModel> categories = [];

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void getDashboardDetails() async {
    setLoading(true);
    Either<String, Map<String, dynamic>> result =
        await HomeRepository.instance.getDashboardDetail();
    result.fold((l) {
      setLoading(false);
    }, (r) {
      popularBook = r["popular_book"] ?? [];
      topSearchBook = r["top_search_book"] ?? [];
      recommendedBook = r["recommended_book"] ?? [];
      topSellBook = r["top_sell_book"] ?? [];
      recentlyAddBook = r["recently_add_book"] ?? [];
      categories = r["category_book"] ?? [];
      setLoading(false);
    });
  }
}
