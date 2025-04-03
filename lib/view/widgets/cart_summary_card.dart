import 'package:diamond_catalog/logic/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartSummaryCard extends StatelessWidget {
  final CartState cartState;

  const CartSummaryCard({
    super.key,
    required this.cartState,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Text summary
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSummaryRow(
                        "Total Items",
                        cartState.items.length.toString(),
                        context,
                      ),
                      const SizedBox(height: 8.0),
                      _buildSummaryRow(
                        "Total Carat",
                        cartState.totalCarat.toStringAsFixed(2),
                        context,
                      ),
                      const SizedBox(height: 8.0),
                      _buildSummaryRow(
                        "Total Price",
                        '\$${cartState.totalPrice.toStringAsFixed(2)}',
                        context,
                      ),
                      const SizedBox(height: 8.0),
                      _buildSummaryRow(
                        "Average Price",
                        '\$${cartState.averagePrice.toStringAsFixed(2)}',
                        context,
                      ),
                      const SizedBox(height: 8.0),
                      _buildSummaryRow(
                        "Average Discount",
                        '${cartState.averageDiscount.toStringAsFixed(2)}%',
                        context,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: theme.textTheme.bodyMedium,
        ),
        Text(
          value,
          style: theme.textTheme.titleSmall,
        ),
      ],
    );
  }
}
