import 'package:flutter/material.dart';
import 'package:my_meals_app/models/meal.dart';
import 'package:my_meals_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({
    super.key,
    required this.favouriteMeals,
    required this.addOrRemoveAMealToFavourites,
  });

  final List<Meal> favouriteMeals;
  final void Function(Meal meal) addOrRemoveAMealToFavourites;

  @override
  Widget build(BuildContext context) {
    return favouriteMeals.isNotEmpty
        ? ListView.builder(
            itemCount: favouriteMeals.length,
            itemBuilder: (ctx, index) => MealItem(
              meal: favouriteMeals[index],
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
