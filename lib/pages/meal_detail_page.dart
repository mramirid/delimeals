import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/meal_detail/ingredients.dart';
import '../widgets/meal_detail/steps.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';

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
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Ingredients(selectedMeal.ingredients),
            Steps(selectedMeal.steps),
          ],
        ),
      ),
    );
  }
}
