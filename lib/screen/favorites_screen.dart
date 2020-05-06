import 'package:ffluttertraning/models/meals.dart';
import 'package:ffluttertraning/widgets/meals_items.dart';
import 'package:flutter/material.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal>favoriteMeal;
  FavoritesScreen(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty){
      return Center(
        child: Text('your have no favorites yet-star add some! '),
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, indext) {
          return MealItem(
            id: favoriteMeal[indext].id,
            title: favoriteMeal[indext].title,
            imageURL: favoriteMeal[indext].imageUrl,
            duaration: favoriteMeal[indext].duration,
            complexity: favoriteMeal[indext].complexity,
            affordability: favoriteMeal[indext].affordability,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }

  }
}
