import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/meal_detail/ingredients.dart';
import '../widgets/meal_detail/steps.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';
  final bool Function(String) _isMealFavorite;
  final void Function(String) _toggleFavorite;

  const MealDetailPage(this._isMealFavorite, this._toggleFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Ingredients(selectedMeal.ingredients),
            Steps(selectedMeal.steps),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _toggleFavorite(mealId),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          _isMealFavorite(mealId) ? Icons.star : Icons.star_border,
          color: Colors.white,
        ),
      ),
    );
  }
}
