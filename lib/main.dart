import 'package:ffluttertraning/dummy_data.dart';
import 'package:ffluttertraning/screen/category_meals_screen.dart';
import 'package:ffluttertraning/screen/category_screen.dart';
import 'package:ffluttertraning/screen/filtes_screen.dart';
import 'package:ffluttertraning/screen/meal_detail_screen.dart';
import 'package:ffluttertraning/screen/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final exittingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealID);
    if(exittingIndex>=0){
      setState(() {
        _favoriteMeal.removeAt(exittingIndex);
      });
    }else{
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal)=>meal.id==mealID));
      });
    }
  }
bool _isMealFavoroite(String id){
    return _favoriteMeal.any((meal)=>meal.id==id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(
                    fontSize: 24,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              )),
//      home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeal),
        CategoryMeals.routerNames: (ctx) => CategoryMeals(_availableMeals),
        MailDetailScreen.routerName: (ctx) => MailDetailScreen(_toggleFavorite,_isMealFavoroite),
        FiltesScreen.routerName: (ctx) => FiltesScreen(_filters, _setFilters),
      },
      onGenerateRoute: (setting) {
        print(setting.arguments);
//        if(setting.name=='/meal-detail'){
//          return ...;
//        }else if(setting.name=='/something-else'){
//          return ..;
//        }
//        return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
