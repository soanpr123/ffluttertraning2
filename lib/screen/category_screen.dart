import 'package:ffluttertraning/widgets/category_item.dart';
import 'package:ffluttertraning/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
          padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((caData) => CategoryItems(caData.id,caData.title, caData.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    ));
  }
}
