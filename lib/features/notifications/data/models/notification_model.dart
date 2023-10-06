import 'package:echo_cash/features/notifications/domain/entities/notification_entity.dart';

/// `NotificationModel` is a data class that represents the structure of a notification.
/// It extends `NotificationEntity` which might be a more abstract or generic representation.
/// 
/// This class provides serialization (from JSON) and deserialization (to JSON) capabilities
/// for a notification.
class NotificationModel extends NotificationEntity{

  /// Constructor for `NotificationModel`.
  const NotificationModel({
    int? id, // Optional ID for the notification.
    required String title, // Title of the notification.
    required String body, // Body or content of the notification.
    required String createdAt // Timestamp when the notification was created.
  }) : super(id: id, title: title, body: body, createdAt: createdAt); // Passing values to the parent class.

  /// Factory constructor to create a `NotificationModel` instance from a JSON map.
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'], // Extracting the ID from the JSON map.
      title: json['title'], // Extracting the title from the JSON map.
      body: json['body'], // Extracting the body from the JSON map.
      createdAt: json['created_at'], // Extracting the creation timestamp from the JSON map.
    );
  }

  /// Method to convert the `NotificationModel` instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id' : id, // Mapping the ID.
      'title' : title, // Mapping the title.
      'body' : body, // Mapping the body or content.
      'created_at': createdAt // Mapping the creation timestamp.
    };
  }
}