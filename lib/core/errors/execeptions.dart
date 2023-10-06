// Represents an exception that arises due to issues on the server side.
// It includes a message to provide more details about the specific server error.
class ServerException implements Exception {
  final String message;

  // Constructor for the ServerException class.
  ServerException({required this.message});
}

// Represents an exception that occurs when trying to access data from a cache, 
// but the cache is empty. It includes a message to provide more context about the error.
class EmptyCacheException implements Exception {
  final String message;

  // Constructor for the EmptyCacheException class.
  EmptyCacheException({required this.message});
}

// Represents an exception related to network connectivity issues.
// This exception is thrown when there's no internet connection.
// It does not carry a message as its name is self-explanatory.
class OfflineException implements Exception {}