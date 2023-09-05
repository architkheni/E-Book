import 'dart:convert';

import 'package:book/api/api_endpoint.dart';
import 'package:book/api/dio_client.dart';
import 'package:book/model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class WishlistRepository {
  WishlistRepository._();
  static final WishlistRepository _instance = WishlistRepository._();
  static WishlistRepository get instance => _instance;

  DioClient dioClient = DioClient();

  Future<Either<String, List<BookModel>>> getWishlistBook(String token) async {
    try {
      Response response = await dioClient.get(ApiEndpoint.userWishlistBook,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right((data["data"] as List<dynamic>)
            .map((e) => BookModel.fromJson(e))
            .toList());
      }
      return left("Some error accured");
    } catch (e) {
      return left(e.toString());
    }
  }
}
