import 'dart:async';
import 'dart:io' show File;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared/shared.dart';

//ignore_for_file: public_member_api_docs
/// RestClient class is used to make API calls using Dio.
class RestClient {
  /// Constructor for RestClient
  RestClient({
    required String baseUrl,
    required String apiKey,
  }) {
    final options = BaseOptions(
      connectTimeout: const Duration(milliseconds: connectionTimeout),
      receiveTimeout: const Duration(milliseconds: receiveTimeout),
      baseUrl: '$baseUrl/rest/v1/',
      headers: {
        'apikey': apiKey,
        'Content-Type': 'application/json',
      },
    );
    _dio = Dio(options);
    _setDioInterceptors();
  }

  late final Dio _dio;

  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    return _handleRequest(
      () => _dio.get(
        path,
        queryParameters: queryParams,
      ),
    );
  }

  Future<Response<dynamic>> post(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    return _handleRequest(
      () => _dio.post(path, data: data, queryParameters: queryParams),
    );
  }

  Future<Response<dynamic>> postFormData(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    return _handleRequest(
      () => _dio.post(
        path,
        data: FormData.fromMap(data),
        queryParameters: queryParams,
      ),
    );
  }

  Future<Response<dynamic>> patch(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    return _handleRequest(
      () => _dio.patch(path, data: data, queryParameters: queryParams),
    );
  }

  Future<Response<dynamic>> put(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    return _handleRequest(
      () => _dio.put(path, data: data, queryParameters: queryParams),
    );
  }

  Future<Response<dynamic>> delete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    return _handleRequest(
      () => _dio.delete(path, data: data, queryParameters: queryParams),
    );
  }

  Future<Response<dynamic>> fileUploadInS3Bucket({
    required String preAssignedUrl,
    required File file,
  }) async {
    return _handleRequest(
      () async => _dio.put(
        preAssignedUrl,
        data: file.openRead(),
        options: Options(
          headers: {Headers.contentLengthHeader: await file.length()},
        ),
      ),
    );
  }

  Future<Response<dynamic>> _handleRequest(
    Future<Response<dynamic>> Function() request,
  ) async {
    try {
      return await request();
    } catch (error) {
      _handleDioError(error);
      rethrow;
    }
  }

  void _handleDioError(dynamic error) {
    if (error is DioException) {
      logE('DIO ERROR: ${error.type} ENDPOINT: ${error.requestOptions.baseUrl}'
          '${error.requestOptions.path}');

      switch (error.type) {
        case DioExceptionType.cancel:
          throw RequestCancelled('Request Cancelled');
        case DioExceptionType.connectionTimeout:
          throw ConnectionTimeout('Connection Timeout');
        case DioExceptionType.receiveTimeout:
          throw RequestTimeout('Request Timeout');
        case DioExceptionType.sendTimeout:
          throw SendTimeout('Send Timeout');
        case DioExceptionType.badResponse:
          throw BadResponse('Bad Response');
        case DioExceptionType.connectionError:
          throw ConnectionError('Connection Error');
        case DioExceptionType.badCertificate:
          throw BadCertificate('Bad Certificate');
        case DioExceptionType.unknown:
          throw UnknownDioError('Unknown Error');
      }
    } else {
      throw Exception('Something went wrong in Dio. Please try again.');
    }
  }

  /// Makes the Log Grey
  void greyLogger(Object message) {
    if (message is String) {
      if (kDebugMode) {
        print('\x1B[37m$message\x1B[0m');
      }
    } else {
      if (kDebugMode) {
        print(message);
      }
    }
  }

  void _setDioInterceptors() {
    final interceptorList = <Interceptor>[];
    if (kDebugMode) {
      interceptorList.add(
        PrettyDioLogger(
          logPrint: greyLogger,
        ),
      );
    }
    _dio.interceptors.addAll(interceptorList);
  }
}
