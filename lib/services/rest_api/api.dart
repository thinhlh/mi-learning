import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:mi_learning/base/models/response_model.dart';
import 'package:mi_learning/core/env/app_config.dart';
import 'package:mi_learning/services/rest_api/interceptors/dio_logger.dart';
import 'package:mi_learning/services/rest_api/interceptors/jwt_interceptor.dart';

abstract class Api {
  Dio get _dio => _initDio();

  Dio _initDio() {
    final Dio dio = Dio();

    final env = AppConfig.instance.env;

    dio
      ..options.baseUrl = env.baseUrl
      ..options.connectTimeout = env.connectionTimeOut
      ..options.receiveTimeout = env.receiveTimeOut
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(PrettyDioLogger(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
      ))
      ..interceptors.add(JWTInterceptor());

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      // You can verify the certificate here
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      return client;
    };

    return dio;
  }

  Future<BaseResponse> get(
    String endpoint, {
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgres,
  }) async {
    try {
      final response = await _dio.get(
        AppConfig.instance.env.baseUrl + endpoint,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgres,
      );

      return BaseResponse.fromMap(response.data);
    } on Exception {
      rethrow;
    }
  }

  Future<BaseResponse> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgres,
  }) async {
    try {
      final response = await _dio.post(
        AppConfig.instance.env.baseUrl + endpoint,
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgres,
      );

      final baseResponse = BaseResponse.fromMap(response.data);

      if (baseResponse.success == false) {
        throw Exception(baseResponse.message);
      }

      return baseResponse;
    } on Exception {
      rethrow;
    }
  }

  Future<BaseResponse> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgres,
  }) async {
    try {
      final response = await _dio.put(
        AppConfig.instance.env.baseUrl + endpoint,
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgres,
      );

      final baseResponse = BaseResponse.fromMap(response.data);

      if (baseResponse.success == false) {
        throw Exception(baseResponse.message);
      }

      return baseResponse;
    } on Exception {
      rethrow;
    }
  }
}
