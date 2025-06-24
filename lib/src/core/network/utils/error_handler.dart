import 'package:dio/dio.dart';
import 'package:flutter_blueprint/src/core/network/exceptions/app_exception.dart';

class ErrorHandler implements Exception {
  late AppException failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }

  AppException _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badResponse:
        return _handleBadResponse(error);
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.connectionError.getFailure();
      default:
        return _handleDefaultError(error);
    }
  }

  _handleBadResponse(DioException error) {
    try {
      final code = error.response?.statusCode ?? ResponseCode.defaultError;
      String message = '';
      switch (code) {
        case ResponseCode.unauthorised:
          return DataSource.unauthorised.getFailure();
        case ResponseCode.forbidden:
          return DataSource.forbidden.getFailure();
        case ResponseCode.notFound:
          return DataSource.notFound.getFailure();
        default:
          message = _extractErrorMessage(error.response?.data);
          return AppException(code: code, message: message);
      }
    } catch (e) {
      return DataSource.defaultError.getFailure();
    }
  }

  _handleDefaultError(DioException error) {
    if (error.response?.statusCode == ResponseCode.noInternetConnection) {
      return DataSource.noInternetConnection.getFailure();
    } else {
      return DataSource.defaultError.getFailure();
    }
  }

  String _extractErrorMessage(dynamic data) {
    if (data is String) return data;
    String message = '';
    if (data is Map) {
      data.forEach((key, value) {
        if (value is List) {
          message += value.join('\n');
        } else if (value is String) {
          message += value;
        } else {
          message += value.toString();
        }
      });
    }
    return message;
  }
}

enum DataSource {
  //success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internetServerError,
  connectTimeout,
  connectionError,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

extension DataSourceExtension on DataSource {
  AppException getFailure() {
    switch (this) {
      //case DataSource.success:
      //return AppException(code: ResponseCode.success, message: ResponseMessage.success);
      case DataSource.noContent:
        return AppException(code: ResponseCode.noContent, message: ResponseMessage.noContent);
      case DataSource.badRequest:
        return AppException(code: ResponseCode.badRequest, message: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return AppException(code: ResponseCode.forbidden, message: ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return AppException(code: ResponseCode.unauthorised, message: ResponseMessage.unauthorised);
      case DataSource.notFound:
        return AppException(code: ResponseCode.notFound, message: ResponseMessage.notFound);
      case DataSource.internetServerError:
        return AppException(
          code: ResponseCode.internalServerError,
          message: ResponseMessage.internalServerError,
        );
      case DataSource.connectTimeout:
        return AppException(
          code: ResponseCode.connectTimeout,
          message: ResponseMessage.connectTimeout,
        );
      case DataSource.connectionError:
        return AppException(
          code: ResponseCode.connectionError,
          message: ResponseMessage.connectionError,
        );
      case DataSource.cancel:
        return AppException(code: ResponseCode.cancel, message: ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return AppException(
          code: ResponseCode.receiveTimeout,
          message: ResponseMessage.receiveTimeout,
        );
      case DataSource.sendTimeout:
        return AppException(code: ResponseCode.sendTimeout, message: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return AppException(code: ResponseCode.cacheError, message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return AppException(
          code: ResponseCode.noInternetConnection,
          message: ResponseMessage.noInternetConnection,
        );
      case DataSource.defaultError:
        return AppException(code: ResponseCode.defaultError, message: ResponseMessage.defaultError);
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorised = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  static const int invalidData = 422; // failure, not found

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int locationDenied = -7;
  static const int defaultError = -8;
  static const int connectionError = -9;
}

class ResponseMessage {
  static const String success = "Success"; // success with data
  static const String noContent = "No content available"; // success with no data (no content)
  static const String badRequest =
      "Bad request. Please check your input."; // failure, API rejected request
  static const String unauthorised =
      "Unauthorized. Please log in again."; // failure, user is not authorised
  static const String forbidden =
      "Forbidden request. You don't have permission."; // failure, API rejected request
  static const String internalServerError =
      "Internal server error. Please try again later."; // failure, crash in server side
  static const String notFound = "Requested resource not found."; // failure, crash in server side

  // local status code
  static const String connectTimeout = "Connection timeout. Please check your network.";
  static const String cancel = "Request was cancelled.";
  static const String receiveTimeout = "Receive timeout. Server took too long to respond.";
  static const String sendTimeout = "Send timeout. Please try again.";
  static const String cacheError = "Cache error. Unable to retrieve data.";
  static const String noInternetConnection = "No internet connection. Please check your network.";
  static const String defaultError = "An unexpected error occurred. Please try again.";
  static const String connectionError = "Connection error. Unable to reach the server.";
}
