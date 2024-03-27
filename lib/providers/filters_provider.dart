import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class FiltersProviderNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersProviderNotifier() : super(kDefaultFilters);

  void updateFilters(Map<Filter, bool> newFilters) {
    state = newFilters;
  }

  void updateFilter({required Filter specificFilter, required bool isSet}) {
    state = {
      ...state,
      specificFilter: isSet,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProviderNotifier, Map<Filter, bool>>(
  (ref) => FiltersProviderNotifier(),
);
