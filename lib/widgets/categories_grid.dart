import 'package:flutter/material.dart';
import 'package:my_meals_app/data/dummy_data.dart';
import 'package:my_meals_app/models/meal.dart';
import 'package:my_meals_app/widgets/category_grid_item.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
    required this.addOrRemoveAMealToFavourites,
    required this.favouriteMeals,
    required this.filteredMeals,
  });

  final void Function(Meal meal) addOrRemoveAMealToFavourites;
  final List<Meal> favouriteMeals;
  final List<Meal> filteredMeals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, top: 10.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2, //3:2
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              addOrRemoveAMealToFavourites: addOrRemoveAMealToFavourites,
              favouriteMeals: favouriteMeals,
              filteredMeals: filteredMeals,
            )
        ],
      ),
    );
  }
}
