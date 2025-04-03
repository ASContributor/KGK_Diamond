part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartItemAdded extends CartEvent {
  final Diamond diamond;

  CartItemAdded(this.diamond);

  @override
  List<Object?> get props => [diamond];
}

class CartItemRemoved extends CartEvent {
  final String lotId;

  CartItemRemoved(this.lotId);

  @override
  List<Object?> get props => [lotId];
}

class CartCleared extends CartEvent {}
