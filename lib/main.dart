import 'package:ffluttertraning/screen/category_meals_screen.dart';
import 'package:ffluttertraning/screen/category_screen.dart';
import 'package:ffluttertraning/screen/meal_detail_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
              title: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold),)),
//      home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/':(ctx)=>CategoriesScreen(),
        CategoryMeals.routerNames:(ctx)=>CategoryMeals(),
        MailDetailScreen.routerName:(ctx)=>MailDetailScreen(),
      },
      onGenerateRoute: (setting){
        print(setting.arguments);
//        if(setting.name=='/meal-detail'){
//          return ...;
//        }else if(setting.name=='/something-else'){
//          return ..;
//        }
//        return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      },
      onUnknownRoute:(setting){
        return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      },
    );
  }
}
