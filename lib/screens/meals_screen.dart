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
    return meals.isNotEmpty
        ? ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              addOrRemoveAMealToFavourites: addOrRemoveAMealToFavourites,
              favouriteMeals: favouriteMeals,
            ),
          )
        : Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Uh Oh ... nothing here",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Try selecting a different Category!",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                )
              ],
            ),
          );
  }
}
