import 'package:internet_connection_checker/internet_connection_checker.dart';

// An abstract class that defines the contract for checking network connectivity.
abstract class NetworkInfo {

  // A getter that returns a Future containing a boolean value indicating 
  // whether the device is connected to the internet.
  Future<bool> get isConnected;

}

// A concrete implementation of the NetworkInfo abstract class.
class NetworkInfoImpl implements NetworkInfo {

  // Instance of InternetConnectionChecker which is presumably a package or library 
  // that provides methods to check the internet connectivity of a device.
  final InternetConnectionChecker connectionChecker;

  // Constructor for the NetworkInfoImpl class.
  NetworkInfoImpl(this.connectionChecker);

  // Overridden getter to fetch the internet connectivity status from the InternetConnectionChecker.
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

}
