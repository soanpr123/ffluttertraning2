

import 'package:ffluttertraning/dummy_data.dart';
import 'package:ffluttertraning/models/meals.dart';
import 'package:ffluttertraning/widgets/meals_items.dart';
import 'package:flutter/material.dart';

class CategoryMeals extends StatefulWidget {
  static const routerNames = '/category-meals';
final List<Meal>availableMeals;
CategoryMeals(this.availableMeals);
  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;

  List<Meal> displayedMeals;
  var loadedInitData = false;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routerArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routerArgs['title'];
      final categoryId = routerArgs['id'];
      displayedMeals = widget.availableMeals.where((meals) {
        return meals.categories.contains(categoryId);
      }).toList();
      loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeItem(String mealsID) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealsID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, indext) {
            return MealItem(
              id: displayedMeals[indext].id,
              title: displayedMeals[indext].title,
              imageURL: displayedMeals[indext].imageUrl,
              duaration: displayedMeals[indext].duration,
              complexity: displayedMeals[indext].complexity,
              affordability: displayedMeals[indext].affordability,

            );
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
