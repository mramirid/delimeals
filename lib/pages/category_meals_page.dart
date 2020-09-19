import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/category_meals/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> _availableMeals;

  const CategoryMealsPage(this._availableMeals);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String _categoryTitle;
  List<Meal> _categoryMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    _categoryTitle = routeArgs['title'];

    _categoryMeals = widget._availableMeals.where((meal) {
      return meal.categoryIds.contains(categoryId);
    }).toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      _categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_categoryTitle)),
      body: ListView.builder(
        itemCount: _categoryMeals.length,
        itemBuilder: (_, index) {
          return MealItem(
            id: _categoryMeals[index].id,
            title: _categoryMeals[index].title,
            imageUrl: _categoryMeals[index].imageUrl,
            duration: _categoryMeals[index].duration,
            complexity: _categoryMeals[index].complexity,
            affordability: _categoryMeals[index].affordability,
            removeMeal: _removeMeal,
          );
        },
      ),
    );
  }
}
