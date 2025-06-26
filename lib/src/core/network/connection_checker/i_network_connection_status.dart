abstract interface class INetworkConnectionStatus {
  Future<bool> get isInternetAvailable;
}