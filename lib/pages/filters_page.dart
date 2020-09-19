import 'package:flutter/material.dart';

import '../models/filters.dart';
import '../widgets/main/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';
  final Filters _filters;
  final Function(Filters) _setFilters;

  const FiltersPage(this._filters, this._setFilters);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  Filters _filters;

  @override
  void initState() {
    super.initState();
    _filters = widget._filters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => widget._setFilters(_filters),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: const Text('Gluten-free'),
                  subtitle: const Text('Only include gluten-free meals'),
                  value: _filters.glutenFree,
                  onChanged: (newValue) {
                    setState(() => _filters.glutenFree = newValue);
                  },
                ),
                SwitchListTile(
                  title: const Text('Lactose-free'),
                  subtitle: const Text('Only include lactose-free meals'),
                  value: _filters.lactoseFree,
                  onChanged: (newValue) {
                    setState(() => _filters.lactoseFree = newValue);
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegetarian'),
                  subtitle: const Text('Only include vegetarian meals'),
                  value: _filters.vegetarian,
                  onChanged: (newValue) {
                    setState(() => _filters.vegetarian = newValue);
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegan'),
                  subtitle: const Text('Only include vegan meals'),
                  value: _filters.vegan,
                  onChanged: (newValue) {
                    setState(() => _filters.vegan = newValue);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
