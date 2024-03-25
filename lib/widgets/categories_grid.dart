import 'package:flutter/material.dart';
import 'package:my_meals_app/data/dummy_data.dart';
import 'package:my_meals_app/models/meal.dart';
import 'package:my_meals_app/widgets/category_grid_item.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
    required this.addOrRemoveAMealToFavourites,
    required this.favouriteMeals,
  });

  final void Function(Meal meal) addOrRemoveAMealToFavourites;
  final List<Meal> favouriteMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            addOrRemoveAMealToFavourites: addOrRemoveAMealToFavourites,
            favouriteMeals: favouriteMeals,
          )
      ],
    );
  }
}
