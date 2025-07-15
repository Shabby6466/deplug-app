part of 'index.dart';

abstract class ErrorHandler {
  /// this method is used to handle server exception status code
  Failure handleStatusCode(int internalCode, String message);

  /// this method is use to return failure
  Failure throwDefaultFailure();
}

@LazySingleton(as: ErrorHandler)
class ErrorHandlerImpl extends ErrorHandler {
  @override
  Failure handleStatusCode(int internalCode, String message) {
    switch (internalCode) {
      case 400:
        return DefaultFailure(message);

      default:
        return const DefaultFailure('something_went_wrong');
    }
  }

  @override
  Failure throwDefaultFailure() {
    return const DefaultFailure('something_went_wrong');
  }
}

class CustomInterceptors extends Interceptor {
  final String jwt;
  final Logger logger;
  final Dio dio;

  CustomInterceptors({
    required this.jwt,
    required this.dio,
    required this.logger,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $jwt';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }
}
