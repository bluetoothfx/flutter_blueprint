import 'package:flutter_blueprint/src/core/network/connection_checker/i_network_connection_status.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnectionStatus implements INetworkConnectionStatus {
  final InternetConnectionChecker _connectionChecker;

  NetworkConnectionStatus({required InternetConnectionChecker connectionChecker})
    : _connectionChecker = connectionChecker;

  @override
  Future<bool> get isInternetAvailable => _connectionChecker.hasConnection;
}
