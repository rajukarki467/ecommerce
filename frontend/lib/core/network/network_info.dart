import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  // This class is intentionally left empty as a placeholder for future network-related utilities.
  final Connectivity connectivity;
  NetworkInfo(this.connectivity);

  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
