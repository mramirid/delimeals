import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  final List<String> _ingredients;

  const Ingredients(this._ingredients);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Text(
            'Ingredients',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            itemCount: _ingredients.length,
            itemBuilder: (_, index) {
              return Card(
                elevation: 2,
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(_ingredients[index]),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
