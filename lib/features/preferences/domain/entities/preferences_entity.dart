import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
/// Represents a user's preferences.
class PreferencesEntity extends Equatable {
  
  /// Indicates whether the theme is dark or light.
  final bool themeIsDark;

  /// Represents the user's preferred language.
  final String language;

  /// Indicates whether notifications are enabled or not.
  final bool notifications;

  /// Constructor that initializes the user's preferences with default values
  /// if they're not provided.
  const PreferencesEntity({
    this.themeIsDark = false,
    this.language = 'en',
    this.notifications = true,
  });

  /// A list of properties that are used by Equatable to determine 
  /// if two instances are equal.
  @override
  List<Object?> get props => [themeIsDark, language, notifications];

  /// Creates a copy of the preferences entity with updated values.
  /// Any parameter that is not provided will default to its current value.
  PreferencesEntity copyWith({
    bool? themeIsDark,
    String? language,
    bool? notifications,
  }) {
    return PreferencesEntity(
      themeIsDark: themeIsDark ?? this.themeIsDark,
      language: language ?? this.language,
      notifications: notifications ?? this.notifications,
    );
  }

  /// Determines the differences between this preferences entity and another.
  /// If a property value differs between the two entities, it will be included in the returned map
  /// with the old and new values.
  Map<String, dynamic> differences(PreferencesEntity other) {
    final Map<String, dynamic> diff = {};

    if (themeIsDark != other.themeIsDark) {
      diff['themeIsDark'] = {'old': themeIsDark, 'new': other.themeIsDark};
    }
    if (language != other.language) {
      diff['language'] = {'old': language, 'new': other.language};
    }
    if (notifications != other.notifications) {
      diff['notifications'] = {'old': notifications, 'new': other.notifications};
    }

    return diff;
  }
}

