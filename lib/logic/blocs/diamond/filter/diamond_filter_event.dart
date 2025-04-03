part of 'diamond_filter_bloc.dart';

abstract class DiamondFilterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CaratRangeChanged extends DiamondFilterEvent {
  final double? minCarat;
  final double? maxCarat;

  CaratRangeChanged({this.minCarat, this.maxCarat});

  @override
  List<Object?> get props => [minCarat, maxCarat];
}

class LabChanged extends DiamondFilterEvent {
  final String? lab;

  LabChanged(this.lab);

  @override
  List<Object?> get props => [lab];
}

class ShapeChanged extends DiamondFilterEvent {
  final String? shape;

  ShapeChanged(this.shape);

  @override
  List<Object?> get props => [shape];
}

class ColorChanged extends DiamondFilterEvent {
  final String? color;

  ColorChanged(this.color);

  @override
  List<Object?> get props => [color];
}

class ClarityChanged extends DiamondFilterEvent {
  final String? clarity;

  ClarityChanged(this.clarity);

  @override
  List<Object?> get props => [clarity];
}

class FilterApplied extends DiamondFilterEvent {}

class FilterReset extends DiamondFilterEvent {}
