import 'package:diamond_catalog/data/data.dart';
import 'package:diamond_catalog/logic/blocs/diamond/filter/diamond_filter_bloc.dart';
import 'package:diamond_catalog/logic/blocs/theme/theme_bloc.dart';
import 'package:diamond_catalog/view/widgets/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final _minCaratController = TextEditingController();
  final _maxCaratController = TextEditingController();
  String? _selectedLab;
  String? _selectedShape;
  String? _selectedColor;
  String? _selectedClarity;

  @override
  void initState() {
    super.initState();
    // Setting initial min/max carat values
    _minCaratController.text = DiamondData.getMinCarat().toString();
    _maxCaratController.text = DiamondData.getMaxCarat().toString();
  }

  @override
  void dispose() {
    _minCaratController.dispose();
    _maxCaratController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    print("Apply Filters Pressed");
    print("Min Carat: ${_minCaratController.text}");
    print("Max Carat: ${_maxCaratController.text}");
    print("Selected Lab: $_selectedLab");
    print("Selected Shape: $_selectedShape");
    print("Selected Color: $_selectedColor");
    print("Selected Clarity: $_selectedClarity");

    final filterBloc = context.read<DiamondFilterBloc>();

    // Apply carat range filter
    filterBloc.add(CaratRangeChanged(
      minCarat: double.tryParse(_minCaratController.text),
      maxCarat: double.tryParse(_maxCaratController.text),
    ));

    // Apply other filters
    filterBloc.add(LabChanged(_selectedLab));
    filterBloc.add(ShapeChanged(_selectedShape));
    filterBloc.add(ColorChanged(_selectedColor));
    filterBloc.add(ClarityChanged(_selectedClarity));

    // Apply all filters
    filterBloc.add(FilterApplied());

    Navigator.pushNamed(context, '/FilterItems');
  }

  void _resetFilters() {
    setState(() {
      _minCaratController.text = DiamondData.getMinCarat().toString();
      _maxCaratController.text = DiamondData.getMaxCarat().toString();
      _selectedLab = null;
      _selectedShape = null;
      _selectedColor = null;
      _selectedClarity = null;
    });
    context.read<DiamondFilterBloc>().add(FilterReset());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Filter"),
          actions: [
            IconButton(
              icon: Icon(
                context.watch<ThemeBloc>().state.themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed: () {
                context.read<ThemeBloc>().add(ThemeToggled());
              },
            ),
            CartButton(),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Carat Range
              Text(
                "caratRange",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _minCaratController,
                      decoration: InputDecoration(
                        labelText: "from",
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: _maxCaratController,
                      decoration: InputDecoration(
                        labelText: "to",
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),

              // Lab selection
              Text(
                "lab",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                value: _selectedLab,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint: Text("lab"),
                items: [
                  const DropdownMenuItem<String>(
                    value: '',
                    child: Text('All'),
                  ),
                  ...DiamondData.getLabOptions().map((lab) {
                    return DropdownMenuItem<String>(
                      value: lab,
                      child: Text(lab),
                    );
                  }),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedLab = value == '' ? null : value;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              // Shape selection
              Text(
                "shape",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                value: _selectedShape,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint: Text("shape"),
                items: [
                  const DropdownMenuItem<String>(
                    value: '',
                    child: Text('All'),
                  ),
                  ...DiamondData.getShapeOptions().map((shape) {
                    return DropdownMenuItem<String>(
                      value: shape,
                      child: Text(shape),
                    );
                  }),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedShape = value == '' ? null : value;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              // Color selection
              Text(
                "color",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                value: _selectedColor,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint: Text("color"),
                items: [
                  const DropdownMenuItem<String>(
                    value: '',
                    child: Text('All'),
                  ),
                  ...DiamondData.getColorOptions().map((color) {
                    return DropdownMenuItem<String>(
                      value: color,
                      child: Text(color),
                    );
                  }),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedColor = value == '' ? null : value;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              // Clarity selection
              Text(
                "clarity",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                value: _selectedClarity,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint: Text("clarity"),
                items: [
                  const DropdownMenuItem<String>(
                    value: '',
                    child: Text('All'),
                  ),
                  ...DiamondData.getClarityOptions().map((clarity) {
                    return DropdownMenuItem<String>(
                      value: clarity,
                      child: Text(clarity),
                    );
                  }),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedClarity = value == '' ? null : value;
                  });
                },
              ),
              const SizedBox(height: 32.0),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _resetFilters,
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      label: Text("Reset Filters"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _applyFilters,
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      label: Text("Search"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
