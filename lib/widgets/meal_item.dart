import 'package:flutter/material.dart';
import 'package:my_meals_app/models/meal.dart';
import 'package:my_meals_app/screens/each_meal_screen.dart';
import 'package:my_meals_app/widgets/meal_item_property.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });

  final Meal meal;

  void _goToEachMealScreen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => EachMealScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10),
      child: InkWell(
        onTap: () {
          _goToEachMealScreen(context);
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Hero(
                tag: meal.id,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 9.0),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          // if the text takes more than two lines
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemProperty(
                              icon: Icons.schedule,
                              label: "${meal.duration} mins",
                            ),
                            const SizedBox(
                              width: 29,
                            ),
                            MealItemProperty(
                                icon: Icons.work, label: meal.complexity.name),
                            const SizedBox(
                              width: 29,
                            ),
                            MealItemProperty(
                                icon: Icons.attach_money,
                                label: meal.affordability.name)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
