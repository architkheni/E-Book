class ApiResult<T> {
  const ApiResult._();
  factory ApiResult.success({T? data, String? message}) = ApiSuccess<T>;
  factory ApiResult.failure({T? data, String? message}) = ApiFailure<T>;
}

class ApiSuccess<T> extends ApiResult<T> {
  T? data;
  String? message;
  ApiSuccess({this.data, this.message}) : super._();
}

class ApiFailure<T> extends ApiResult<T> {
  T? data;
  String? message;
  ApiFailure({this.data, this.message}) : super._();
}
