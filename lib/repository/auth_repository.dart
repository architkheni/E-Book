import 'dart:convert';

import 'package:book/api/api_endpoint.dart';
import 'package:book/api/dio_client.dart';
import 'package:book/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  AuthRepository._();

  static final AuthRepository _instance = AuthRepository._();

  static AuthRepository get instance => _instance;

  DioClient dioClient = DioClient();

  Future<Either<String, UserModel>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.login,
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right(UserModel.fromJson(data['data']));
      } else if (response.statusCode == 400) {
        return left(response.data['message']);
      } else {
        return left('Login failed! please try again');
      }
    } catch (e) {
      return left('These credentials do not match our records.');
    }
  }

  Future<Either<String, UserModel>> register({
    required String name,
    required String username,
    required String mobileNo,
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.register,
        data: {
          'user_type': 'user',
          'name': name,
          'username': username,
          'contact_number': mobileNo,
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        return right(UserModel.fromJson(data['data']));
      } else if (response.statusCode == 400) {
        return left(response.data['message']);
      } else {
        return left('Register failed! please try again');
      }
    } catch (e) {
      return left('Register failed! please try again');
    }
  }

  Future<Either<String, bool>> forgotPassword({required String email}) async {
    try {
      Response response = await dioClient
          .post(ApiEndpoint.forgetPassword, data: {'email': email});
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
        return left('Some error accured! Please try again');
      } else {
        return left('Some error accured! Please try again');
      }
    } catch (e) {
      return left('Some error accured! Please try again');
    }
  }

  Future<Either<String, String>> resendOtp({required String email}) async {
    try {
      Response response =
          await dioClient.post(ApiEndpoint.resendOtp, data: {'email': email});
      if (response.statusCode == 200) {
        dynamic data = response.data;
        if (data.runtimeType == String) {
          data = jsonDecode(data);
        }
        if (data['status'] == false) {
          return left(data['message']);
        }
        return right(data['message']);
      } else if (response.statusCode == 500) {
        return left('Some error accured! Please try again');
      } else {
        return left('Some error accured! Please try again');
      }
    } catch (e) {
      return left('Some error accured! Please try again');
    }
  }

  Future<Either<String, bool>> verifyToken({
    required String email,
    required String code,
  }) async {
    try {
      Response response = await dioClient
          .post(ApiEndpoint.verifyToken, data: {'email': email, 'code': code});
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
        return left('Some error accured! Please try again');
      } else {
        return left('Some error accured! Please try again');
      }
    } catch (e) {
      return left('Some error accured! Please try again');
    }
  }

  Future<Either<String, bool>> updatePassword({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.updatePassword,
        data: {'email': email, 'password': password},
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
        return left('Some error accured! Please try again');
      } else {
        return left('Some error accured! Please try again');
      }
    } catch (e) {
      return left('Some error accured! Please try again');
    }
  }

  Future<Either<String, bool>> logout({required String token}) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.logout,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
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
        return left('Some error accured! Please try again');
      } else {
        return left('Some error accured! Please try again');
      }
    } catch (e) {
      return left('Some error accured! Please try again');
    }
  }

  Future<Either<String, bool>> changePassword({
    required String token,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      Response response = await dioClient.post(
        ApiEndpoint.changePassword,
        data: {
          'old_password':currentPassword,
          'new_password':newPassword,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
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
      }
      return left('Some error accured! Please try again');
    } catch (e) {
      return left('Some error accured! Please try again');
    }
  }
}
