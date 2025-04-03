part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<Diamond> items;

  const CartState({this.items = const []});

  @override
  List<Object?> get props => [items];

  double get totalCarat => items.fold(0, (sum, item) => sum + item.carat);

  double get totalPrice => items.fold(0, (sum, item) => sum + item.finalAmount);

  double get averagePrice => items.isEmpty ? 0 : totalPrice / items.length;

  double get averageDiscount => items.isEmpty
      ? 0
      : items.fold(0.0, (sum, item) => sum + item.discount) / items.length;

  bool isInCart(String lotId) => items.any((diamond) => diamond.lotId == lotId);

  CartState copyWith({
    List<Diamond>? items,
  }) {
    return CartState(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory CartState.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('items')) {
      return const CartState();
    }

    final itemsJson = json['items'] as List?;
    if (itemsJson == null || itemsJson.isEmpty) {
      return const CartState();
    }

    final items = itemsJson
        .map((itemJson) => Diamond.fromJson(itemJson as Map<String, dynamic>))
        .toList();

    return CartState(items: items);
  }
}
