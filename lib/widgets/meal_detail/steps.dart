import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  final List<String> _steps;

  const Steps(this._steps);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Text(
            'Steps',
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
            itemCount: _steps.length,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Text('#${index + 1}')),
                    title: Text(_steps[index]),
                  ),
                  const Divider(color: Colors.black),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
