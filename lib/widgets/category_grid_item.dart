import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_meals_app/data/dummy_data.dart';
import 'package:my_meals_app/models/category.dart';
import 'package:my_meals_app/models/meal.dart';
import 'package:my_meals_app/providers/filters_provider.dart';
import 'package:my_meals_app/screens/meals_screen.dart';

class CategoryGridItem extends ConsumerWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
  });

  final Category category;

  void onCategorySelected(context, WidgetRef ref) {
    Map<Filter, bool> userFilters = ref.read(filtersProvider);

    List<Meal> filteredMeals = dummyMeals.where(
      (meal) {
        if (userFilters[Filter.isGlutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (userFilters[Filter.isLactoseFree]! && !meal.isLactoseFree) {
          return false;
        }
        if (userFilters[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        if (userFilters[Filter.vegeterian]! && !meal.isVegetarian) {
          return false;
        }
        return true;
      },
    ).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: filteredMeals
              .where(
                (meal) => meal.categories.contains(category.id),
              )
              .toList(),
          categoryTitle: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        onCategorySelected(context, ref);
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
