import 'package:ffluttertraning/dummy_data.dart';
import 'package:flutter/material.dart';

class MailDetailScreen extends StatelessWidget {
  static const routerName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorit;
  MailDetailScreen(this.toggleFavorite, this.isFavorit);
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selected = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selected.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selected.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selected.ingredients[index]),
                ),
              ),
              itemCount: selected.ingredients.length,
            )),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, indext) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(indext + 1)}'),
                    ),
                    title: Text(selected.steps[indext]),
                  ),
                  Divider()
                ],
              ),
              itemCount: selected.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorit(mealID) ? Icons.star : Icons.star_border),
        onPressed: ()=>toggleFavorite(mealID),
      ),
    );
  }
}
