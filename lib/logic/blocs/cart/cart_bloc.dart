import 'package:diamond_catalog/data/models/diamond.dart';
import 'package:equatable/equatable.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';
// Cart State

// Cart Bloc
class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartItemAdded>(_onCartItemAdded);
    on<CartItemRemoved>(_onCartItemRemoved);
    on<CartCleared>(_onCartCleared);
  }

  void _onCartItemAdded(CartItemAdded event, Emitter<CartState> emit) {
    if (!state.isInCart(event.diamond.lotId)) {
      final updatedItems = List<Diamond>.from(state.items)..add(event.diamond);
      emit(state.copyWith(items: updatedItems));
    }
  }

  void _onCartItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
    final updatedItems = List<Diamond>.from(state.items)
      ..removeWhere((item) => item.lotId == event.lotId);
    emit(state.copyWith(items: updatedItems));
  }

  void _onCartCleared(CartCleared event, Emitter<CartState> emit) {
    emit(const CartState());
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    return CartState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    return state.toJson();
  }
}
