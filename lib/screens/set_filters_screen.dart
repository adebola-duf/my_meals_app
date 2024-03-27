import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_meals_app/providers/filters_provider.dart';

class SetFiltersScreen extends ConsumerStatefulWidget {
  const SetFiltersScreen({
    super.key,
  });

  @override
  ConsumerState<SetFiltersScreen> createState() => _SetFiltersScreenState();
}

class _SetFiltersScreenState extends ConsumerState<SetFiltersScreen> {
  @override
  Widget build(BuildContext context) {
    Map<Filter, bool> userFilters = ref.watch(filtersProvider);
    bool veganFilterSet = userFilters[Filter.vegan]!;
    bool vegeterianFilterSet = userFilters[Filter.vegeterian]!;
    bool glutenFreeFilterSet = userFilters[Filter.isGlutenFree]!;
    bool lactoseFreeFilterSet = userFilters[Filter.isLactoseFree]!;

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
          Navigator.of(context).pop();
        },
        child: Column(
          children: [
            // a widget optimized for being presented in a list full of switches where you can set a label for that switch and the switch can also be turned on and off
            SwitchListTile(
              value: glutenFreeFilterSet,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).updateFilter(
                      specificFilter: Filter.isGlutenFree,
                      isSet: isChecked,
                    );
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
              value: lactoseFreeFilterSet,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).updateFilter(
                      specificFilter: Filter.isLactoseFree,
                      isSet: isChecked,
                    );
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
              value: veganFilterSet,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).updateFilter(
                      specificFilter: Filter.vegan,
                      isSet: isChecked,
                    );
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
              value: vegeterianFilterSet,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).updateFilter(
                      specificFilter: Filter.vegeterian,
                      isSet: isChecked,
                    );
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
