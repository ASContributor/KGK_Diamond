import 'package:diamond_catalog/logic/blocs/cart/cart_bloc.dart';
import 'package:diamond_catalog/logic/blocs/diamond/filter/diamond_filter_bloc.dart';
import 'package:diamond_catalog/logic/blocs/diamond/sort/diamond_sort_bloc.dart';
import 'package:diamond_catalog/view/widgets/diamond_card.dart';
import 'package:diamond_catalog/view/widgets/sort_options_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
    // Initial sort based on final price
    final diamonds = context.read<DiamondFilterBloc>().state.filteredDiamonds;
    context.read<DiamondSortBloc>().add(SortApplied(diamonds));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: _showSortOptions,
          ),
        ],
      ),
      body: BlocBuilder<DiamondSortBloc, DiamondSortState>(
        builder: (context, sortState) {
          final diamonds = sortState.sortedDiamonds.isEmpty
              ? context.read<DiamondFilterBloc>().state.filteredDiamonds
              : sortState.sortedDiamonds;

          if (diamonds.isEmpty) {
            return Center(
              child: Text(
                "noResults",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: diamonds.length,
            itemBuilder: (context, index) {
              final diamond = diamonds[index];
              return BlocBuilder<CartBloc, CartState>(
                builder: (context, cartState) {
                  final isInCart = cartState.isInCart(diamond.lotId);
                  return DiamondCard(
                    diamond: diamond,
                    isInCart: isInCart,
                    onAddToCart: () {
                      context.read<CartBloc>().add(CartItemAdded(diamond));
                    },
                    onRemoveFromCart: () {
                      context
                          .read<CartBloc>()
                          .add(CartItemRemoved(diamond.lotId));
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  void _showSortOptions() {
    showDialog(
      context: context,
      builder: (context) => const SortOptionsDialog(),
    ).then((value) {
      if (value != null && value is List<dynamic> && value.length == 2) {
        final criteria = value[0] as SortCriteria;
        final direction = value[1] as SortDirection;

        final bloc = context.read<DiamondSortBloc>();
        bloc.add(SortCriteriaChanged(criteria));
        bloc.add(SortDirectionChanged(direction));
        bloc.add(SortApplied(
            context.read<DiamondFilterBloc>().state.filteredDiamonds));
      }
    });
  }
}
