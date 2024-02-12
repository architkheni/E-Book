import 'dart:convert';

import 'package:book/api/api_endpoint.dart';
import 'package:book/api/dio_client.dart';
import 'package:book/model/book_chapter_model.dart';
import 'package:book/model/book_model.dart';
import 'package:book/model/category_model.dart';
import 'package:book/model/language_model.dart';
import 'package:book/model/subcategory_model.dart';
import 'package:book/presentation/detail_page_container_page/model/detail_model.dart';
import 'package:book/presentation/home/model/dashboard_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  HomeRepository._();
  static final HomeRepository _instance = HomeRepository._();
  static HomeRepository get instance => _instance;

  DioClient dioClient = DioClient();

  Future<Either<String, DashboardModel>> getDashboardDetail({
    required String token,
  }) async {
    try {
      Response response = await dioClient.get(
        ApiEndpoint.dashboardDetails,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        DashboardModel dashboardModel = DashboardModel.fromJson(data);
        return right(dashboardModel);
      }
      return left('Some error accured');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<CategoryModel>>> getAllCategories() async {
    try {
      Response response = await dioClient.get(ApiEndpoint.categoryList);
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        data = data['data'];
        return right(
          (data as List<dynamic>)
              .map((e) => CategoryModel.fromJson(e))
              .toList(),
        );
      }
      return left('some error accured');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<SubcategoryModel>>> getSubCategories(
    int categoryId,
  ) async {
    try {
      Response response = await dioClient
          .post(ApiEndpoint.subCategoryList, data: {'category_id': categoryId});
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        data = data['data'];
        return right(
          (data as List<dynamic>)
              .map((e) => SubcategoryModel.fromJson(e))
              .toList(),
        );
      }
      return left('some error accured');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<BookModel>>> getCategoryBooks(
    int subCategoryId,
  ) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.subCategoryBookList,
        data: FormData.fromMap({'subcategory_id': subCategoryId}),
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        data = data['Books'];
        return right(
          (data as List<dynamic>).map((e) => BookModel.fromJson(e)).toList(),
        );
      }
      return left('some error accured');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<BookModel>>> searchBook(
    String search,
  ) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.searchBook,
        data: {'param': search},
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        data = data['data'];
        return right(
          (data as List<dynamic>).map((e) => BookModel.fromJson(e)).toList(),
        );
      }
      return left('some error accured');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, DetailModel>> getBookDetails(int bookId, {required String token}) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.bookDetails,
        data: {'book_id': bookId},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right(DetailModel.fromJson(data));
      }
      return left('some error accured');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<LanguageModel>>> getAllLanguage(
    String token,
  ) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.language,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        List<LanguageModel> languages = (data['data'] as List<dynamic>)
            .map((e) => LanguageModel.fromJson(e))
            .toList();
        return right(languages);
      }
      return left('some error accured');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<BookChapterModel>>> getBookChapter(
    int bookId,
  ) async {
    try {
      Response response = await dioClient
          .post(ApiEndpoint.bookDescription, data: {'book_id': bookId});
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        List<BookChapterModel> languages = (data['chapters'] as List<dynamic>)
            .map((e) => BookChapterModel.fromJson(e))
            .toList();
        return right(languages);
      }
      return left('some error accured');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> readChapter(
    int bookId,
    int chapterId,
    String token,
  ) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.readingChapter,
        data: {'book_id': bookId, 'chapter_id': chapterId},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right(true);
      }
      return left('some error accured');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> markAsBookFinished(
    int bookId,
    String token,
  ) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.bookFinished,
        data: {'book_id': bookId,},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right(true);
      }
      return left('some error accured');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, List<BookModel>>> getViewAllBooks({
    required String param,
    required String token,
    required String key,
  }) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.viewAll,
        data: {'param': param},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        List<BookModel> book = (data[key] as List<dynamic>)
            .map((e) => BookModel.fromJson(e))
            .toList();
        return right(book);
      } else {
        return left('some error accured');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
