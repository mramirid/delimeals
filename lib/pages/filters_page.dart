import 'package:flutter/material.dart';

import '../widgets/main/main_drawer.dart';

class FiltersPage extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      drawer: MainDrawer(),
      body: const Center(
        child: Text('Filters page'),
      ),
    );
  }
}
