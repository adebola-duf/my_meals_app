import 'package:flutter/material.dart';
import 'package:my_meals_app/screens/favourites_screen.dart';
import 'package:my_meals_app/widgets/categories_grid.dart';
import 'package:my_meals_app/models/meal.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;

  String _activePageTitle = "Categories";

  final List<Meal> _favouriteMeals = [];

  void _changePage(int index) {
    setState(() {
      _selectedPageIndex = index;
      if (_selectedPageIndex == 0) {
        _activePageTitle = "Categories";
        return;
      }

      _activePageTitle = "Favourites";
    });
  }

  void _addOrRemoveAMealToFavourites(Meal meal) {
    ScaffoldMessenger.of(context).clearSnackBars();
    // to make sure when we unfavourite any meal from the favourites screen, the favourites screen is built again
    // with the correct favouriteMeals list
    setState(() {
      if (_favouriteMeals.contains(meal)) {
        _favouriteMeals.remove(meal);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("You have unfavourited ${meal.title}."),
            duration: const Duration(seconds: 2),
          ),
        );
        return;
      }

      _favouriteMeals.add(meal);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${meal.title} is now a favourite."),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePageContent = _selectedPageIndex == 0
        ? CategoriesGrid(
            addOrRemoveAMealToFavourites: _addOrRemoveAMealToFavourites,
            favouriteMeals: _favouriteMeals,
          )
        : FavouritesScreen(
            addOrRemoveAMealToFavourites: _addOrRemoveAMealToFavourites,
            favouriteMeals: _favouriteMeals,
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(_activePageTitle),
      ),
      body: activePageContent,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
          ),
        ],
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          _changePage(index);
        },
      ),
    );
  }
}
