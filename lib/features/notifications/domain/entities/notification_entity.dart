import 'package:equatable/equatable.dart';

/// `NotificationEntity` class represents the core structure of a notification.
/// It extends `Equatable` to enable easy value comparison.
class NotificationEntity extends Equatable{

  /// The unique identifier for the notification.
  final int? id;

  /// The title of the notification.
  final String title;

  /// The main content or message of the notification.
  final String body;

  /// The timestamp indicating when the notification was created.
  final String createdAt;

  /// Constructor for creating a new instance of `NotificationEntity`.
  const NotificationEntity({
    this.id,
    required this.title,
    required this.body,
    required this.createdAt
  });

  /// Overrides the `props` from `Equatable` to provide a list of properties
  /// that will be used to determine whether two instances are equal.
  @override
  List<Object?> get props => [id, title, body, createdAt];
}