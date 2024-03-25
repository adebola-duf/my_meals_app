import 'package:flutter/material.dart';
import 'package:my_meals_app/data/dummy_data.dart';
import 'package:my_meals_app/screens/favourites_screen.dart';
import 'package:my_meals_app/widgets/categories_grid.dart';
import 'package:my_meals_app/models/meal.dart';
import 'package:my_meals_app/widgets/main_drawer.dart';
import 'package:my_meals_app/screens/set_filters_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key, this.pageIndex = 0});
  final int pageIndex;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  @override
  void initState() {
    super.initState();
    _selectedPageIndex = widget.pageIndex;
  }

  String _activePageTitle = "Categories";
  final List<Meal> _favouriteMeals = [];
  Map<Filter, bool> _userFilters = kDefaultFilters;
  List<Meal> _filteredMeals = dummyMeals;

  void _changeUserFilters(Map<Filter, bool> newFilters) {
    setState(
      () {
        _userFilters = newFilters;

        _filteredMeals = dummyMeals.where(
          (meal) {
            if (_userFilters[Filter.isGlutenFree]! && !meal.isGlutenFree) {
              return false;
            }
            if (_userFilters[Filter.isLactoseFree]! && !meal.isLactoseFree) {
              return false;
            }
            if (_userFilters[Filter.vegan]! && !meal.isVegan) {
              return false;
            }
            if (_userFilters[Filter.vegeterian]! && !meal.isVegetarian) {
              return false;
            }
            return true;
          },
        ).toList();
      },
    );
  }

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
            action: SnackBarAction(
              backgroundColor: Colors.black,
              textColor: Colors.white,
              label: "Go To Favourites",
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                setState(() {
                  _selectedPageIndex = 1;
                });
              },
            ),
          ),
        );
        return;
      }

      _favouriteMeals.add(meal);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${meal.title} is now a favourite."),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            backgroundColor: Colors.black,
            textColor: Colors.white,
            label: "Go To Favourites",
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              setState(() {
                _selectedPageIndex = 1;
              });
            },
          ),
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
            filteredMeals: _filteredMeals,
          )
        : FavouritesScreen(
            addOrRemoveAMealToFavourites: _addOrRemoveAMealToFavourites,
            favouriteMeals: _favouriteMeals,
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(_activePageTitle),
      ),
      drawer: MainDrawer(
        changeUserFilters: _changeUserFilters,
        userFilters: _userFilters,
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
