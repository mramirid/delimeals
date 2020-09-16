import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget _buildSectionTitle({
    String text,
    double verticalMargin,
    BuildContext context,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildSectionContainer({
    Widget child,
    double height,
    double width,
    double allPadding,
    double marginBottom = 0,
  }) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(bottom: marginBottom),
      padding: EdgeInsets.all(allPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    final appBarWidget = AppBar(title: Text(selectedMeal.title));

    final bodyWidth = MediaQuery.of(context).size.width;
    final bodyHeight = MediaQuery.of(context).size.height -
        appBarWidget.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBarWidget,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: bodyHeight * 0.5,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(
              text: 'Ingredients',
              verticalMargin: bodyHeight * 0.025,
              context: context,
            ),
            _buildSectionContainer(
              height: bodyHeight * 0.3,
              width: bodyWidth * 0.8,
              allPadding: bodyHeight * 0.02,
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 2,
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: bodyHeight * 0.01,
                        horizontal: bodyWidth * 0.02,
                      ),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            _buildSectionTitle(
              text: 'Steps',
              verticalMargin: bodyHeight * 0.025,
              context: context,
            ),
            _buildSectionContainer(
              height: bodyHeight * 0.3,
              width: bodyWidth * 0.8,
              allPadding: bodyHeight * 0.02,
              marginBottom: bodyHeight * 0.05,
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('#${index + 1}')),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider(color: Colors.black),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
