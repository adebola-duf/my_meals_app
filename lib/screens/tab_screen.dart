import 'package:flutter/material.dart';
import 'package:my_meals_app/screens/favourites_screen.dart';
import 'package:my_meals_app/widgets/categories_grid.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;

  Widget _activePageContent = const CategoriesGrid();

  void _changePage(int index) {
    setState(() {
      _selectedPageIndex = index;
      if (_selectedPageIndex == 0) {
        _activePageContent = const CategoriesGrid();
        return;
      }

      _activePageContent = const FavouritesScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Meals inc"),
      ),
      body: _activePageContent,
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
