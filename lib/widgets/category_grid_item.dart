import 'package:flutter/material.dart';
import 'package:my_meals_app/models/category.dart';
import 'package:my_meals_app/models/meal.dart';
import 'package:my_meals_app/screens/meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.addOrRemoveAMealToFavourites,
    required this.favouriteMeals,
    required this.filteredMeals,
  });

  final Category category;
  final void Function(Meal meal) addOrRemoveAMealToFavourites;
  final List<Meal> favouriteMeals;
  final List<Meal> filteredMeals;

  void onCategorySelected(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => 
        Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: MealsScreen(
          meals: filteredMeals
              .where(
                (meal) => meal.categories.contains(category.id),
              )
              .toList(),
          categoryTitle: category.title,
          addOrRemoveAMealToFavourites: addOrRemoveAMealToFavourites,
          favouriteMeals: favouriteMeals,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        onCategorySelected(context);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
