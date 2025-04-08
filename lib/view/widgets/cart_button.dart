import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/cart/cart_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.shopping_cart_outlined),
          Positioned(
            right: -6,
            top: -6,
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, cartState) {
                final itemCount = cartState.items.length;
                if (itemCount == 0) {
                  return const SizedBox(); // No badge if cart is empty
                }
                return Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$itemCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/cart');
      },
    );
  }
}
