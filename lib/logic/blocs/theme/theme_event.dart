part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ThemeToggled extends ThemeEvent {}
