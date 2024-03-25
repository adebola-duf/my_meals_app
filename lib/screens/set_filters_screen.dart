import 'package:flutter/material.dart';

enum Filter {
  vegan,
  vegeterian,
  isGlutenFree,
  isLactoseFree,
}

const kDefaultFilters = {
  Filter.isGlutenFree: false,
  Filter.isLactoseFree: false,
  Filter.vegan: false,
  Filter.vegeterian: false,
};

class SetFiltersScreen extends StatefulWidget {
  const SetFiltersScreen({
    super.key,
    required this.userFilters,
  });

  final Map<Filter, bool> userFilters;

  @override
  State<SetFiltersScreen> createState() => _SetFiltersScreenState();
}

class _SetFiltersScreenState extends State<SetFiltersScreen> {

  bool _veganFilterSet = false;
  bool _vegeterianFilterSet = false;
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;

@override
  void initState() {
    super.initState();
    _veganFilterSet = widget.userFilters[Filter.vegan]!;
    _vegeterianFilterSet = widget.userFilters[Filter.vegeterian]!;
    _glutenFreeFilterSet = widget.userFilters[Filter.isGlutenFree]!;
    _lactoseFreeFilterSet = widget.userFilters[Filter.isLactoseFree]!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          Navigator.of(context).pop(
            {
              Filter.isGlutenFree: _glutenFreeFilterSet,
              Filter.isLactoseFree: _lactoseFreeFilterSet,
              Filter.vegan: _veganFilterSet,
              Filter.vegeterian: _vegeterianFilterSet,
            },
          );
        },
        child: Column(
          children: [
            // a widget optimized for being presented in a list full of switches where you can set a label for that switch and the switch can also be turned on and off
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                "Gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include gluten-free meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              // activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include lactose-free meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              // activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include vegan meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              // activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegeterianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegeterianFilterSet = isChecked;
                });
              },
              title: Text(
                "Vegeterian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only include vegeterian meals.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              // activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
  }
}
