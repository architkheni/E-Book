import 'dart:convert';

import 'package:book/api/api_endpoint.dart';
import 'package:book/api/dio_client.dart';
import 'package:book/model/packages_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PackageRepositiry {
  PackageRepositiry._();
  static final PackageRepositiry _instance = PackageRepositiry._();
  static PackageRepositiry get instance => _instance;

  DioClient dioClient = DioClient();

  Future<Either<String, PackagesResponse>> getPackageDetails({
    required String token,
  }) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.packages,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        PackagesResponse dashboardModel = PackagesResponse.fromJson(data);
        return right(dashboardModel);
      }
      return left('Some error accured');
    } catch (e) {
      return left(e.toString());
    }
  }
}
