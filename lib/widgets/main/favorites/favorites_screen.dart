import 'package:flutter/material.dart';

import '../../../models/meal.dart';
import '../../meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> _favoritedMeals;

  const FavoritesScreen(this._favoritedMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _forceRebuildScreen() {
    setState(() {
      // Rebuilding the favorites screen
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget._favoritedMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemCount: widget._favoritedMeals.length,
        itemBuilder: (_, index) {
          return MealItem(
            id: widget._favoritedMeals[index].id,
            title: widget._favoritedMeals[index].title,
            imageUrl: widget._favoritedMeals[index].imageUrl,
            duration: widget._favoritedMeals[index].duration,
            complexity: widget._favoritedMeals[index].complexity,
            affordability: widget._favoritedMeals[index].affordability,
            forceRebuildScreen: _forceRebuildScreen,
          );
        },
      );
    }
  }
}
