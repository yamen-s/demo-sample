import 'package:equatable/equatable.dart';

// An abstract base class representing a failure. This class extends Equatable 
// to make it easier to compare instances for equality without needing to override 
// the '==' operator and hashCode getter.
abstract class Failure extends Equatable {
  final String message;

  // Constructor for the Failure class.
  const Failure({required this.message});

  // Overridden props from the Equatable class. This helps in determining
  // equality between two Failure objects.
  @override
  List<Object?> get props => [message];
}

// Represents a failure that occurs when there's no internet connection.
class OfflineFailure extends Failure {
  // Constructor for the OfflineFailure class. The 'super.message' syntax is used 
  // to pass the message to the parent (Failure) class.
  const OfflineFailure({required super.message});

  // Overridden props from the Equatable class.
  @override
  List<Object?> get props => [];
}

// Represents a failure that arises due to issues on the server side.
class ServerFailure extends Failure {
  // Constructor for the ServerFailure class.
  const ServerFailure({required super.message});

  // Overridden props from the Equatable class. 
  @override
  List<Object?> get props => [message];
}

// Represents a failure that arises when trying to access data from a cache, 
// but the cache is empty.
class EmptyCacheFailure extends Failure {
  // Constructor for the EmptyCacheFailure class.
  const EmptyCacheFailure({required super.message});

  // Overridden props from the Equatable class.
  @override
  List<Object?> get props => [];
}
