import 'package:flutter/material.dart';
import 'package:naples_accounts/screens/weather_screen.dart';
 import 'package:provider/provider.dart';
import './models/weather.dart';
 import './providers/products.dart';
import './screens/sales_screen.dart';
import './screens/edit_product_screen.dart';
import './fade_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
     ChangeNotifierProvider(
      create: (_) => Products(),
     ),
      ChangeNotifierProvider(
      create: (_) => Weather(),
      )],
      child: MaterialApp(
          title: 'MyShop',
          // theme: ThemeData(
          //   primarySwatch: Colors.purple,
          //   accentColor: Colors.deepOrange,
          //   fontFamily: 'Lato',
          // ),
          home:ParentingAnimationWidget(),
          routes: {
           
         WeatherScreen.routeName: (ctx) => WeatherScreen(),
                  SalesScreen.routeName: (ctx) => SalesScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          }),
    );
  }
}

