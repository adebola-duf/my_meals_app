import 'package:flutter/material.dart';
import 'package:my_meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class EachMealScreen extends StatefulWidget {
  const EachMealScreen({
    super.key,
    required this.meal,
    required this.addOrRemoveAMealToFavourites,
    required this.favouriteMeals,
  });

  final Meal meal;
  final void Function(Meal meal) addOrRemoveAMealToFavourites;
  final List<Meal> favouriteMeals;

  @override
  State<EachMealScreen> createState() => _EachMealScreenState();
}

class _EachMealScreenState extends State<EachMealScreen> {
  bool _mealFavouriteStatus = false;
  @override
  void initState() {
    _mealFavouriteStatus = widget.favouriteMeals.contains(widget.meal);
    super.initState();
  }

  void _changeMealFavouriteStatus() {
    setState(() {
      _mealFavouriteStatus = !_mealFavouriteStatus;
      widget.addOrRemoveAMealToFavourites(widget.meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 13.0),
            child: IconButton(
              icon: _mealFavouriteStatus
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border_outlined),
              onPressed: _changeMealFavouriteStatus,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.hardEdge,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(widget.meal.imageUrl),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final ingredient in widget.meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Instructions",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final step in widget.meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
