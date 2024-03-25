import 'package:flutter/material.dart';

import 'package:my_meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    required this.categoryTitle,
  });

  final List<Meal> meals;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Column(
        children: [
          for (final meal in meals)
            Text(
              meal.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            )
        ],
      ),
    );
  }
}
