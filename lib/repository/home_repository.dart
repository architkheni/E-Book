import 'dart:convert';

import 'package:book/api/api_endpoint.dart';
import 'package:book/api/dio_client.dart';
import 'package:book/model/book_model.dart';
import 'package:book/model/category_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  HomeRepository._();
  static final HomeRepository _instance = HomeRepository._();
  static HomeRepository get instance => _instance;

  DioClient dioClient = DioClient();

  Future<Either<String, Map<String, dynamic>>>
      getDashboardDetail() async {
    try {
      Response response = await dioClient.get(ApiEndpoint.dashboardDetails);
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        List<BookModel> popularBook = data["popular_book"] != null
            ? (data["popular_book"] as List<dynamic>)
                .map((e) => BookModel.fromJson(e))
                .toList()
            : [];
        List<BookModel> topSearchBook = data["top_search_book"] != null
            ? (data["top_search_book"] as List<dynamic>)
                .map((e) => BookModel.fromJson(e))
                .toList()
            : [];
        List<BookModel> topSellBook = data["top_sell_book"] != null
            ? (data["top_sell_book"] as List<dynamic>)
                .map((e) => BookModel.fromJson(e))
                .toList()
            : [];
        List<BookModel> recommendedBook = data["recommended_book"] != null
            ? (data["recommended_book"] as List<dynamic>)
                .map((e) => BookModel.fromJson(e))
                .toList()
            : [];
        List<BookModel> recentlyAddBook = data["recently_add_book"] != null
            ? (data["recently_add_book"] as List<dynamic>)
                .map((e) => BookModel.fromJson(e))
                .toList()
            : [];
        List<CategoryModel> categories = data["category_book"] != null
            ? (data["category_book"] as List<dynamic>)
                .map((e) => CategoryModel.fromJson(e))
                .toList()
            : [];

        return right({
          "popular_book": popularBook,
          "top_search_book": topSearchBook,
          "top_sell_book": topSellBook,
          "recommended_book": recommendedBook,
          "recently_add_book": recentlyAddBook,
          "category_book":categories,
        });
      }
      return left("Some error accured");
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
        data = data["data"];
        return right((data as List<dynamic>)
            .map((e) => CategoryModel.fromJson(e))
            .toList());
      }
      return left("some error accured");
    } catch (e) {
      return left(e.toString());
    }
  }
}
