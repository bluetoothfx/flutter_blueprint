import 'package:dio/dio.dart';
import 'package:flutter_blueprint/src/core/constants/app_constants.dart';
import 'package:flutter_blueprint/src/core/network/connection_checker/i_network_connection_status.dart';
import 'package:flutter_blueprint/src/core/network/exceptions/app_exception.dart';
import 'package:flutter_blueprint/src/core/network/utils/error_handler.dart';

class ConnectivityInterceptor extends Interceptor {
  final INetworkConnectionStatus networkStatusInfo;

  ConnectivityInterceptor({required this.networkStatusInfo});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!await networkStatusInfo.isInternetAvailable) {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: AppException(message: AppConstants.noInternet, code: ResponseCode.connectionError),
        ),
      );
      return;
    }
    handler.next(options);
  }
}
