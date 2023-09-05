import 'dart:convert';

import 'package:book/api/api_endpoint.dart';
import 'package:book/api/dio_client.dart';
import 'package:book/model/category_model.dart';
import 'package:book/presentation/detail_page_container_page/model/detail_model.dart';
import 'package:book/presentation/home/model/dashboard_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  HomeRepository._();
  static final HomeRepository _instance = HomeRepository._();
  static HomeRepository get instance => _instance;

  DioClient dioClient = DioClient();

  Future<Either<String, DashboardModel>> getDashboardDetail() async {
    try {
      Response response = await dioClient.get(ApiEndpoint.dashboardDetails);
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        DashboardModel dashboardModel = DashboardModel.fromJson(data);
        return right(dashboardModel);
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

  Future<Either<String, DetailModel>> getBookDetails(int bookId) async {
    try {
      Response response = await dioClient
          .post(ApiEndpoint.bookDetails, data: {"book_id": bookId});
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right(DetailModel.fromJson(data));
      }
      return left("some error accured");
    } catch (e) {
      return left(e.toString());
    }
  }
}
