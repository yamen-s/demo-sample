import 'package:echo_cash/features/preferences/domain/entities/preferences_entity.dart';

// ignore: must_be_immutable
/// A data model class that extends `PreferencesEntity` and provides functionalities
/// to convert between the object and JSON representation of user preferences.
class PreferencesModel extends PreferencesEntity {

  /// Constructs a `PreferencesModel` with given values or defaults.
  /// By default, `themeIsDark` is set to `false`, `language` is set to 'en', and `notifications` is set to `true`.
  const PreferencesModel({
    themeIsDark = false,
    language = 'en',
    notifications = true
  }) : super(themeIsDark: themeIsDark, language: language, notifications: notifications);

  /// Factory constructor to create a `PreferencesModel` instance from a JSON map.
  factory PreferencesModel.fromJson(Map<String, dynamic> json) {
    return PreferencesModel(
      themeIsDark: json['themeIsDark'],
      language: json['language'],
      notifications: json['notifications'],
    );
  }

  /// Converts the `PreferencesModel` instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'themeIsDark' : themeIsDark,
      'language' : language,
      'notifications' : notifications,
    };
  }
}