

import 'package:ffluttertraning/models/meals.dart';
import 'package:ffluttertraning/screen/category_screen.dart';
import 'package:ffluttertraning/screen/favorites_screen.dart';
import 'package:ffluttertraning/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal>favoriteMeal;
  TabsScreen(this.favoriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, Object>> page;
  int selectPageindex = 0;
  @override
  void initState() {
page=[
  {'page': CategoriesScreen(), 'title': 'Categories'},
  {'page': FavoritesScreen(widget.favoriteMeal), 'title': ' Your Favorite'}
];
super.initState();
  }
  void _selectTab(int index) {
    setState(() {
      selectPageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page[selectPageindex]['title']),
      ),
      drawer: MainDrawer(),
      body: page[selectPageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectPageindex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
