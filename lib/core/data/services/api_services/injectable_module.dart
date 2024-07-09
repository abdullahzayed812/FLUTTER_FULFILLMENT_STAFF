import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectableModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();

  @lazySingleton
  Dio get dioInstance {
    final dio = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'clientTZ': 'Asia/Dubai',
        },
        validateStatus: (statusCode) {
          if (statusCode != null) {
            if (200 <= statusCode && statusCode < 300) {
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        },
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          // Map<String, String> headers;

          ///TODO: Add Token Here , get SignedIn
          // final failureOrToken =
          //     await getIt<AuthRepository>().getSignedInUser();
          // final token = failureOrToken.getOrElse(() => SignedInUser()).token;
          // if (token != null) {
          //   headers = {'Authorization': 'Bearer ${token}'};
          //   request.headers.addAll(headers);
          // }

          request
            ..sendTimeout = (request.data is FormData)
                ? const Duration(milliseconds: 300000)
                : const Duration(milliseconds: 60000)
            ..connectTimeout = const Duration(milliseconds: 5000)
            ..receiveTimeout = const Duration(milliseconds: 60000);

          return handler.next(request);
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        logPrint: (obj) {
          debugPrint(obj.toString());
        },
      ),
    );
    dio.interceptors.add(CurlLoggerDioInterceptor());
    return dio;
  }

  @lazySingleton
  Logger get logger => Logger();
}
