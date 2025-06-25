import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'i_api_client.dart';

class DioClient implements IApiClient {
  final Dio _dio;

  DioClient({required Dio dio}) : _dio = dio;

  //final _logger = BuildConfig.instance.envConfig.logger;

  final Type _tag = DioClient;

  @override
  Future<Response> get({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await _dio.get(endpoint, data: data, queryParameters: params);
    } on DioException {
      rethrow;
    } catch (error) {
      throw error;
      //throw Exception("${AppStrings.unexpectedError} $error");
    }
  }

  @override
  Future<Response> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? params,
  }) async {
    try {
      printLog(_dio.options.baseUrl);
      final response = await _dio.post(endpoint, data: data, queryParameters: params);

      return response;
    } on DioException catch (e) {
      printLog(e.toString());
      rethrow;
    } catch (error) {
      throw error;
      //throw Exception("${AppStrings.unexpectedError} $error");
    }
  }

  @override
  Future<Response> delete({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? params,
  }) async {
    try {
      printLog(_dio.options.baseUrl);
      final response = await _dio.delete(endpoint, data: data, queryParameters: params);

      return response;
    } on DioException catch (e) {
      printLog(e.toString());
      rethrow;
    } catch (error) {
      throw error;
      //throw Exception("${AppStrings.unexpectedError} $error");
    }
  }

  @override
  Future<Response> patch({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? params,
  }) async {
    try {
      printLog(_dio.options.baseUrl);
      final response = await _dio.patch(endpoint, data: data, queryParameters: params);

      return response;
    } on DioException catch (e) {
      printLog(e.toString());
      rethrow;
    } catch (error) {
      throw error;
      //throw Exception("${AppStrings.unexpectedError} $error");
    }
  }

  @override
  Future<Response> put({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? params,
  }) async {
    try {
      printLog(_dio.options.baseUrl);
      final response = await _dio.put(endpoint, data: data, queryParameters: params);

      return response;
    } on DioException catch (e) {
      printLog(e.toString());
      rethrow;
    } catch (error) {
      throw error;
      //throw Exception("${AppStrings.unexpectedError} $error");
    }
  }

  void printLog(String s) {
    if (kDebugMode) {
      //_logger.d("$_tag: $s");
    }
  }
}
