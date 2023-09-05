import 'package:book/model/book_model.dart';
import 'package:book/model/category_model.dart';

class DashboardModel {
  List<BookModel> popularBook;
  List<BookModel> topSearchBook;
  List<BookModel> recommendedBook;
  List<BookModel> topSellBook;
  List<BookModel> recentlyAddBook;
  List<CategoryModel> categories;

  DashboardModel({
    this.popularBook = const [],
    this.topSearchBook = const [],
    this.recommendedBook = const [],
    this.topSellBook = const [],
    this.recentlyAddBook = const [],
    this.categories = const [],
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      popularBook: json["popular_book"] != null
          ? (json["popular_book"] as List<dynamic>)
              .map((e) => BookModel.fromJson(e))
              .toList()
          : [],
      topSearchBook: json["top_search_book"] != null
          ? (json["top_search_book"] as List<dynamic>)
              .map((e) => BookModel.fromJson(e))
              .toList()
          : [],
      topSellBook: json["top_sell_book"] != null
          ? (json["top_sell_book"] as List<dynamic>)
              .map((e) => BookModel.fromJson(e))
              .toList()
          : [],
      recommendedBook: json["recommended_book"] != null
          ? (json["recommended_book"] as List<dynamic>)
              .map((e) => BookModel.fromJson(e))
              .toList()
          : [],
      recentlyAddBook: json["recently_add_book"] != null
          ? (json["recently_add_book"] as List<dynamic>)
              .map((e) => BookModel.fromJson(e))
              .toList()
          : [],
      categories: json["category_book"] != null
          ? (json["category_book"] as List<dynamic>)
              .map((e) => CategoryModel.fromJson(e))
              .toList()
          : [],
    );
  }

  @override
  String toString() {
    return "${popularBook.toString()} ${topSearchBook.toString()} ${topSellBook.toString()} ${recentlyAddBook.toString()} ${recommendedBook.toString()} ${categories.toString()} ";
  }
}
