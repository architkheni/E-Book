import 'dart:convert';

import 'package:book/api/api_endpoint.dart';
import 'package:book/api/dio_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepository {
  ProfileRepository._();
  static final ProfileRepository _instance = ProfileRepository._();
  static ProfileRepository get instance => _instance;

  DioClient dioClient = DioClient();

  Future<Either<String, bool>> saveUserCategory(
      {required String token, required List<int> category}) async {
    try {
      Response response = await dioClient.post(ApiEndpoint.saveUserCategory,
          options: Options(headers: {"Authorization": "Bearer $token"}),
          data: {"categories": category});
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        if (data["status"] == false) {
          return left(data["message"]);
        }
        return right(true);
      } else if (response.statusCode == 500) {
        return left("Internal server error");
      } else {
        return left("Some error accured");
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> saveUserLanguage(
      {required String token, required List<int> languages}) async {
    try {
      Response response = await dioClient.post(ApiEndpoint.saveUserLanguage,
          options: Options(headers: {"Authorization": "Bearer $token"}),
          data: {"languages": languages});
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        if (data["status"] == false) {
          return left(data["message"]);
        }
        return right(true);
      } else if (response.statusCode == 500) {
        return left("Internal server error");
      } else {
        return left("Some error accured");
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
