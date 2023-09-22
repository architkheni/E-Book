import 'package:book/api/api_endpoint.dart';
import 'package:book/api/api_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio();
  final ApiInterceptors apiInterceptors = ApiInterceptors();

  DioClient._() {
    init();
  }

  static final DioClient _instance = DioClient._();

  factory DioClient() {
    return _instance;
  }

  void init() {
    dio.options = BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
      headers: {'Content-Type': 'application/json'},
    );
    dio.interceptors.add(apiInterceptors.interceptorsWrapper());
    dio.interceptors.add(apiInterceptors.prettyDioLogger());
  }

  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    Response response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    Response response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }
}
