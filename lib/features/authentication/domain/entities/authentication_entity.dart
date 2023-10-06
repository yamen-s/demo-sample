import 'package:equatable/equatable.dart';

// Defines an AuthenticationEntity class which extends the Equatable class to support value-based equality.
class AuthenticationEntity extends Equatable {
  
  // Optional integer ID of the user or authentication session.
  final int? id;
  
  // Optional name of the user.
  final String? name;
  
  // Optional email address of the user.
  final String? email;
  
  // Optional password of the user. (It's typically not a good idea to store passwords directly, consider hashing or encrypting if necessary).
  final String? password;
  
  // Optional message, might be used for status or error messages.
  final String? message;
  
  // Optional device ID, might be used to identify a specific device.
  final String? deviceID;
  
  // Optional token, possibly an authentication token or session token.
  final String? token;

  // Constructor for the AuthenticationEntity class, allowing all fields to be set optionally.
  const AuthenticationEntity({this.id, this.name, this.email, this.password , this.message,this.deviceID,this.token});

  // Overrides the 'props' getter from Equatable to provide a list of properties 
  // that determines the value-based equality of instances.
  @override
  List<Object?> get props => [id, name,email,password, message,deviceID,token];
}