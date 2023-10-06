import 'package:echo_cash/features/authentication/domain/entities/authentication_entity.dart';

// The AuthenticationModel class extends the AuthenticationEntity class. 
// While AuthenticationEntity can be seen as a pure domain representation, 
// the AuthenticationModel is tailored for data operations, such as JSON serialization.
class AuthenticationModel extends AuthenticationEntity {
  // ggggg
  // Constructor for the AuthenticationModel class.
  // Initializes its super class (AuthenticationEntity) with the provided parameters.
  const AuthenticationModel({
    int? id, 
    String? name, 
    String? email, 
    String? password, 
    String? message,
    String? deviceID,
    String? token
  }) : super(id: id, name: name, email: email, password: password, message: message, deviceID: deviceID, token: token);

  // Factory constructor to create an instance of AuthenticationModel from a JSON object (Map<String, dynamic>).
  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      message: json['message'],
      deviceID: json['deviceID'],
      token: json['token'],
    );
  }

  // Method to convert the AuthenticationModel object to a JSON object (Map<String, dynamic>).
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'email' : email,
      'password' : password,
      'message' : message,
      'deviceID': deviceID,
      'token': token,
    };
  }
}