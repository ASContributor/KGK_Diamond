import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diamond_catalog/logic/blocs/diamond/sort/diamond_sort_bloc.dart';

class SortOptionsDialog extends StatefulWidget {
  const SortOptionsDialog({Key? key}) : super(key: key);

  @override
  State<SortOptionsDialog> createState() => _SortOptionsDialogState();
}

class _SortOptionsDialogState extends State<SortOptionsDialog> {
  late SortCriteria _selectedCriteria;
  late SortDirection _selectedDirection;

  @override
  void initState() {
    super.initState();
    final sortState = context.read<DiamondSortBloc>().state;
    _selectedCriteria = sortState.criteria;
    _selectedDirection = sortState.direction;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text("sortBy"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sort criteria selection
          Text(
            'Criteria',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          RadioListTile<SortCriteria>(
            title: Text("finalPrice"),
            value: SortCriteria.finalPrice,
            groupValue: _selectedCriteria,
            onChanged: (value) {
              setState(() {
                _selectedCriteria = value!;
              });
            },
          ),
          RadioListTile<SortCriteria>(
            title: Text("caratWeight"),
            value: SortCriteria.caratWeight,
            groupValue: _selectedCriteria,
            onChanged: (value) {
              setState(() {
                _selectedCriteria = value!;
              });
            },
          ),
          const SizedBox(height: 16),

          // Sort direction selection
          Text(
            'Direction',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          RadioListTile<SortDirection>(
            title: Text("ascending"),
            value: SortDirection.ascending,
            groupValue: _selectedDirection,
            onChanged: (value) {
              setState(() {
                _selectedDirection = value!;
              });
            },
          ),
          RadioListTile<SortDirection>(
            title: Text("descending"),
            value: SortDirection.descending,
            groupValue: _selectedDirection,
            onChanged: (value) {
              setState(() {
                _selectedDirection = value!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, [_selectedCriteria, _selectedDirection]);
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
