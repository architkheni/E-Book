import 'package:book/model/author_model.dart';
import 'package:book/model/book_chapter_model.dart';
import 'package:book/model/book_model.dart';
import 'package:book/model/book_rating_model.dart';
import 'package:book/model/category_model.dart';

class DetailModel {
  BookModel? book;
  List<BookChapterModel> bookChapter;
  List<AuthorModel> authors;
  List<CategoryModel> categoryBook;
  List<BookModel> authorBookList;
  List<BookModel> similarBook;
  List<BookRatingModel> bookRating;

  DetailModel({
    this.book,
    this.bookChapter = const [],
    this.authors = const [],
    this.categoryBook = const [],
    this.authorBookList = const [],
    this.similarBook = const [],
    this.bookRating = const [],
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      book: BookModel.fromJson(json['book_detail']),
      categoryBook: json['book_detail']['category_book'] == null
          ? []
          : (json['book_detail']['category_book'] as List<dynamic>)
              .map((e) => CategoryModel.fromJson(e))
              .toList(),
      bookChapter: json['book_chapter'] != null
          ? (json['book_chapter'] as List<dynamic>)
              .map((e) => BookChapterModel.fromJson(e))
              .toList()
          : [],
      authors: json['author_detail'] != null
          ? (json['author_detail'] as List<dynamic>)
              .map((e) => AuthorModel.fromJson(e))
              .toList()
          : [],
      authorBookList: json['author_book_list'] != null
          ? (json['author_book_list'] as List<dynamic>)
              .map((e) => BookModel.fromJson(e))
              .toList()
          : [],
      similarBook: json['similar_books'] != null
          ? (json['similar_books'] as List<dynamic>)
              .map((e) => BookModel.fromJson(e))
              .toList()
          : [],
      bookRating: json['book_rating_data'] != null
          ? (json['book_rating_data'] as List<dynamic>)
              .map((e) => BookRatingModel.fromJson(e))
              .toList()
          : [],
    );
  }

  @override
  String toString() {
    return bookChapter.toString();
  }
}
