import 'dart:convert';

import 'package:book/api/api_endpoint.dart';
import 'package:book/api/dio_client.dart';
import 'package:book/core/storage/app_storage.dart';
import 'package:book/model/paypal_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PaymentRepository {
  PaymentRepository._();

  static final PaymentRepository _instance = PaymentRepository._();

  static PaymentRepository get instance => _instance;

  DioClient dioClient = DioClient();

  Future<Either<String, Map<String, dynamic>>> applyPromocode({
    required String code,
  }) async {
    String token = await AppStorage().getToken();
    try {
      final response = await dioClient.post(
        ApiEndpoint.promocodes,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: FormData.fromMap({'code': code}),
      );
      dynamic data = response.data as Map<String, dynamic>;
      data = data['data'];
      if (data != null) {
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right(data);
      } else {
        return left(data['error']);
      }
    } catch (e) {
      return left('Server error accured');
    }
  }

  Future<Either<String, PaypalCredentials>> getPaypalData() async {
    String token = await AppStorage().getToken();
    try {
      final response = await dioClient.get(
        ApiEndpoint.paypalCredentials,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      dynamic data = response.data as Map<String, dynamic>;
      data = data['data'];
      if (data != null) {
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right(PaypalCredentials.fromJson(data));
      } else {
        return left(data['error']);
      }
    } catch (e) {
      return left('Server error accured');
    }
  }
}
