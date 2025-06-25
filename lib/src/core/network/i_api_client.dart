import 'package:dio/dio.dart';

abstract interface class IApiClient {
  Future<Response> get({required String endpoint, Object? data, Map<String, dynamic>? params});

  Future<Response> post({required String endpoint, Object? data, Map<String, dynamic>? params});

  Future<Response> delete({required String endpoint, Object? data, Map<String, dynamic>? params});

  Future<Response> patch({required String endpoint, Object? data, Map<String, dynamic>? params});

  Future<Response> put({required String endpoint, Object? data, Map<String, dynamic>? params});
}
