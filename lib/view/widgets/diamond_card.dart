import 'package:diamond_catalog/data/models/diamond.dart';
import 'package:flutter/material.dart';

class DiamondCard extends StatefulWidget {
  final Diamond diamond;
  final bool isInCart;
  final Function()? onAddToCart;
  final Function()? onRemoveFromCart;
  final bool showAddButton;

  const DiamondCard({
    super.key,
    required this.diamond,
    required this.isInCart,
    this.onAddToCart,
    this.onRemoveFromCart,
    this.showAddButton = true,
  });

  @override
  State<DiamondCard> createState() => _DiamondCardState();
}

class _DiamondCardState extends State<DiamondCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Basic diamond info section
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(
                '${"lotId"}: ${widget.diamond.lotId}',
                style: theme.textTheme.titleMedium,
              ),
              subtitle: Container(
                child: Text(
                  '${widget.diamond.carat} ${"caratWeight"} | ${widget.diamond.shape} | ${widget.diamond.color} | ${widget.diamond.clarity}',
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\$${widget.diamond.finalAmount.toStringAsFixed(2)}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),

          // Expandable details section
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: Container(),
            secondChild: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow("size", widget.diamond.size),
                  _buildDetailRow("lab", widget.diamond.lab),
                  _buildDetailRow("cut", widget.diamond.cut),
                  _buildDetailRow("polish", widget.diamond.polish),
                  _buildDetailRow("symmetry", widget.diamond.symmetry),
                  _buildDetailRow("fluorescence", widget.diamond.fluorescence),
                  _buildDetailRow("discount", '${widget.diamond.discount}%'),
                  _buildDetailRow("perCaratRate",
                      '\$${widget.diamond.perCaratRate.toStringAsFixed(2)}'),
                  _buildDetailRow("finalAmount",
                      '\$${widget.diamond.finalAmount.toStringAsFixed(2)}'),
                  if (widget.diamond.keyToSymbol.isNotEmpty)
                    _buildDetailRow("keyToSymbol", widget.diamond.keyToSymbol),
                  if (widget.diamond.labComment.isNotEmpty)
                    _buildDetailRow("labComment", widget.diamond.labComment),
                ],
              ),
            ),
          ),

          // Action buttons section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  icon: Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                  label: Text(
                    _isExpanded ? 'Show Less' : 'Show More',
                  ),
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                ),
                const Spacer(),
                if (widget.isInCart)
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.remove_shopping_cart,
                      color: Colors.white,
                    ),
                    label: Text("Remove from Cart"),
                    onPressed: widget.onRemoveFromCart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  )
                else if (widget.showAddButton)
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                    label: Text("Add to Cart"),
                    onPressed: widget.onAddToCart,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
