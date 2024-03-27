import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_meals_app/data/dummy_data.dart';
import 'package:my_meals_app/providers/filters_provider.dart';
import 'package:my_meals_app/widgets/category_grid_item.dart';

class CategoriesGrid extends ConsumerWidget {
  const CategoriesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, top: 10.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2, //3:2
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
            )
        ],
      ),
    );
  }
}
