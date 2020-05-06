import 'package:ffluttertraning/dummy_data.dart';
import 'package:ffluttertraning/widgets/meals_items.dart';
import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  static const routerNames = '/category-meals';
//   final String categoryId;
//   final String categoryTitle;
//   CategoryMeals(this.categoryId,this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routerArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routerArgs['title'];
    final categoryId = routerArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meals) {
      return meals.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, indext) {
            return MealItem(
              id: categoryMeals[indext].id,
              title: categoryMeals[indext].title,
              imageURL: categoryMeals[indext].imageUrl,
              duaration: categoryMeals[indext].duration,
              complexity: categoryMeals[indext].complexity,
              affordability: categoryMeals[indext].affordability,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
