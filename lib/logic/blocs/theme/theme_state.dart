part of 'theme_bloc.dart';

enum ThemeModeData { light, dark }

class ThemeState extends Equatable {
  final ThemeModeData themeMode;

  const ThemeState({this.themeMode = ThemeModeData.light});

  @override
  List<Object?> get props => [themeMode];

  ThemeState copyWith({
    ThemeModeData? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode.index,
    };
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(
      themeMode: ThemeModeData.values[json['themeMode'] as int],
    );
  }
}
