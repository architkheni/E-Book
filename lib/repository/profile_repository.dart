import 'dart:convert';

import 'package:book/api/api_endpoint.dart';
import 'package:book/api/dio_client.dart';
import 'package:book/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepository {
  ProfileRepository._();
  static final ProfileRepository _instance = ProfileRepository._();
  static ProfileRepository get instance => _instance;

  DioClient dioClient = DioClient();

  Future<Either<String, bool>> saveUserCategory({
    required String token,
    required List<int> category,
  }) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.saveUserCategory,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: {'categories': category},
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        if (data['status'] == false) {
          return left(data['message']);
        }
        return right(true);
      } else if (response.statusCode == 500) {
        return left('Internal server error');
      } else {
        return left('Some error accured');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> saveUserLanguage({
    required String token,
    required List<int> languages,
  }) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.saveUserLanguage,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: {'languages': languages},
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        if (data['status'] == false) {
          return left(data['message']);
        }
        return right(true);
      } else if (response.statusCode == 500) {
        return left('Internal server error');
      } else {
        return left('Some error accured');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, UserModel>> saveUserProfile({
    required String token,
    required String name,
    required String username,
    required String contactNumber,
    String? path,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'contact_number': contactNumber,
        'username': username,
      });
      if (path != null) {
        formData.files
            .add(MapEntry('profile_image', await MultipartFile.fromFile(path)));
      }
      Response response = await dioClient.post(
        ApiEndpoint.saveUserProfile,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
        data: formData,
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right(UserModel.fromJson(data['data']));
      } else if (response.statusCode == 500) {
        return left('Detail not save successfully');
      } else {
        return left('Detail not save successfully');
      }
    } catch (e) {
      return left('Detail not save successfully');
    }
  }

  Future<Either<String, String>> contactUs({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.contactUs,
        data: {
          'name': name,
          'email': email,
          'subject': subject,
          'comment': message,
        },
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right(data['message']);
      } else if (response.statusCode == 500) {
        return left('Detail not save successfully');
      } else {
        return left('Detail not save successfully');
      }
    } catch (e) {
      return left('Detail not save successfully');
    }
  }

  Future<Either<String, Map<String, dynamic>>> saveTransaction({
    required String token,
    required String transactionId,
    required String status,
    required String type,
    required int packageId,
    required String packageType,
  }) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.saveTransaction,
        data: {
          'txn_id': transactionId,
          'payment_status': status,
          'payment_type': type,
          'package_id': packageId,
          'package_type': packageType,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right({
          'status': data['status'],
          'message': data['message'],
        });
      } else if (response.statusCode == 500) {
        return left('you already subscribed this package');
      } else {
        return left('you already subscribed this package');
      }
    } catch (e) {
      return left('you already subscribed this package');
    }
  }
}
