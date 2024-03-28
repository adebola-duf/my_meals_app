import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_meals_app/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:my_meals_app/screens/tab_screen.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  void addOrRemoveMealFromFavourites(
      {required Meal meal, required BuildContext context}) {
    ScaffoldMessenger.of(context).clearSnackBars();

    if (state.contains(meal)) {
      // we want to remove that meal
      state = state.where((nmeal) => meal != nmeal).toList();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("You have unfavourited ${meal.title}."),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            backgroundColor: Theme.of(context).colorScheme.background,
            textColor: Colors.white,
            label: "Go To Favourites",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TabScreen(selectedPageIndex: 1),
                ),
              );
              // _changePage(1);
            },
          ),
        ),
      );

      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${meal.title} is now a favourite."),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          backgroundColor: Theme.of(context).colorScheme.background,
          textColor: Theme.of(context).colorScheme.onBackground,
          label: "Go To Favourites",
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TabScreen(selectedPageIndex: 1),
              ),
            );

            // _changePage(1);
          },
        ),
      ),
    );
    state = [...state, meal];
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
  (ref) => FavouriteMealsNotifier(),
);
