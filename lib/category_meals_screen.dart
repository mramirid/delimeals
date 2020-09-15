import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String _categoryId;
  final String _categoryTitle;

  const CategoryMealsScreen(this._categoryId, this._categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_categoryTitle)),
      body: const Center(
        child: Text('The recipes for the category'),
      ),
    );
  }
}
