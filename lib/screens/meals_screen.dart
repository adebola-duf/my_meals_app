import 'package:flutter/material.dart';

import 'package:my_meals_app/models/meal.dart';
import 'package:my_meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.categoryTitle,
  });

  final List<Meal> meals;
  final String? categoryTitle;

  @override
  Widget build(BuildContext context) {
    Widget screenContent = meals.isEmpty
        ? Center(
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
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
            ),
          );
    return categoryTitle != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(categoryTitle!),
            ),
            body: screenContent,
          )
        : screenContent;
  }
}
