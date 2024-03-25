import 'package:flutter/material.dart';

import 'package:my_meals_app/models/meal.dart';
import 'package:my_meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    required this.categoryTitle,
    required this.addOrRemoveAMealToFavourites,
    required this.favouriteMeals,
  });

  final List<Meal> meals;
  final String categoryTitle;
  final void Function(Meal meal) addOrRemoveAMealToFavourites;
  final List<Meal> favouriteMeals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          addOrRemoveAMealToFavourites: addOrRemoveAMealToFavourites,
          favouriteMeals: favouriteMeals,
        ),
      ),
    );
  }
}
