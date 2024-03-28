import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_meals_app/models/meal.dart';
import 'package:my_meals_app/providers/favourite_meals_provider.dart';
import 'package:my_meals_app/screens/meals_screen.dart';
import 'package:my_meals_app/widgets/categories_grid.dart';
import 'package:my_meals_app/widgets/main_drawer.dart';

class TabScreen extends ConsumerStatefulWidget {
    const TabScreen({super.key, required this.selectedPageIndex,});
// I am putting this here just in case we want to 
  final int selectedPageIndex;

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {

  late int _selectedPageIndex;
  @override
  void initState() {
 _selectedPageIndex = widget.selectedPageIndex;
    super.initState();
  }
  String _activePageTitle = "Categories";

  void _changePage(int index) {
    setState(() {
      _selectedPageIndex = index;
      if (_selectedPageIndex == 0) {
        _activePageTitle = "Categories";
        return;
      }

      _activePageTitle = "Your Favourites";
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Meal> favouriteMeals = ref.watch(favouriteMealsProvider);
    Widget activePageContent = _selectedPageIndex == 0
        ? const CategoriesGrid()
        : MealsScreen(meals: favouriteMeals);

    return Scaffold(
      appBar: AppBar(
        title: Text(_activePageTitle),
      ),
      drawer: const MainDrawer(),
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
