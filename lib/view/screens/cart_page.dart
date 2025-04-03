import 'package:diamond_catalog/logic/blocs/cart/cart_bloc.dart';
import 'package:diamond_catalog/view/widgets/cart_summary_card.dart';
import 'package:diamond_catalog/view/widgets/diamond_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_shopping_cart_outlined,
                    size: 64,
                    color: Theme.of(context).disabledColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Empty",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              // Cart items list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final diamond = state.items[index];
                    return DiamondCard(
                      diamond: diamond,
                      isInCart: true,
                      showAddButton: false,
                      onRemoveFromCart: () {
                        context.read<CartBloc>().add(
                              CartItemRemoved(diamond.lotId),
                            );
                      },
                    );
                  },
                ),
              ),
              // Divider between summary and items
              const Divider(thickness: 1),
              // Cart summary at the top
              CartSummaryCard(cartState: state),
            ],
          );
        },
      ),
    );
  }
}
