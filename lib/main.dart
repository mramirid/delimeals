import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'models/filters.dart';
import 'models/meal.dart';
import 'pages/category_meals_page.dart';
import 'pages/filters_page.dart';
import 'pages/main_page.dart';
import 'pages/meal_detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = Filters(
    glutenFree: false,
    lactoseFree: false,
    vegetarian: false,
    vegan: false,
  );
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoritedMeals = [];

  void _setFilters(Filters newFilters) {
    setState(() {
      _filters = newFilters;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters.glutenFree && !meal.isGlutenFree) {
          return false;
        } else if (_filters.lactoseFree && !meal.isLactoseFree) {
          return false;
        } else if (_filters.vegan && !meal.isVegan) {
          return false;
        } else if (_filters.vegetarian && !meal.isVegetarian) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoritedMeals.indexWhere((favoritedMeal) {
      return favoritedMeal.id == mealId;
    });

    setState(() {
      if (existingIndex >= 0) {
        _favoritedMeals.removeAt(existingIndex);
      } else {
        _favoritedMeals.add(
          dummyMeals.firstWhere((meal) => meal.id == mealId),
        );
      }
    });
  }

  bool _isMealFavorite(String mealId) {
    return _favoritedMeals.any((favoritedMeal) => favoritedMeal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        MainPage.routeName: (_) => MainPage(_favoritedMeals),
        CategoryMealsPage.routeName: (_) => CategoryMealsPage(_availableMeals),
        MealDetailPage.routeName: (_) => MealDetailPage(_isMealFavorite, _toggleFavorite),
        FiltersPage.routeName: (_) => FiltersPage(_filters, _setFilters),
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(builder: (_) => MainPage(_favoritedMeals));
      },
    );
  }
}
