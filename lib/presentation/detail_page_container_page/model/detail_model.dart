import 'package:book/model/author_model.dart';
import 'package:book/model/book_chapter_mode.dart';
import 'package:book/model/book_model.dart';
import 'package:book/model/book_rating_mode.dart';

class DetailModel {
  BookModel? book;
  List<BookChapterModel> bookChapter;
  List<AuthorModel> authors;
  List<BookModel> authorBookList;
  List<BookModel> recommendedBook;
  List<BookRatingModel> bookRating;

  DetailModel({
    this.book,
    this.bookChapter = const [],
    this.authors = const [],
    this.authorBookList = const [],
    this.recommendedBook = const [],
    this.bookRating = const [],
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      book: (json["book_detail"] as List<dynamic>)
          .map((e) => BookModel.fromJson(e))
          .toList()
          .first,
      bookChapter: json["book_chapter"] != null
          ? (json["book_chapter"] as List<dynamic>)
              .map((e) => BookChapterModel.fromJson(e))
              .toList()
          : [],
      authors: json["author_detail"] != null
          ? (json["author_detail"] as List<dynamic>)
              .map((e) => AuthorModel.fromJson(e))
              .toList()
          : [],
      authorBookList: json["author_book_list"] != null
          ? (json["author_book_list"] as List<dynamic>)
              .map((e) => BookModel.fromJson(e))
              .toList()
          : [],
      recommendedBook: json["recommended_book"] != null
          ? (json["recommended_book"] as List<dynamic>)
              .map((e) => BookModel.fromJson(e))
              .toList()
          : [],
      bookRating: json["book_rating_data"] != null
          ? (json["book_rating_data"] as List<dynamic>)
              .map((e) => BookRatingModel.fromJson(e))
              .toList()
          : [],
    );
  }

  @override
  String toString() {
    print(bookChapter.toString());
    return super.toString();
  }
}