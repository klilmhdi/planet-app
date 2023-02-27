import 'package:flutter/material.dart';
import 'package:plant_app/screens/home_screen.dart';
import 'package:plant_app/share/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(color: primaryColor),
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        textTheme: Theme
            .of(context)
            .textTheme
            .apply(bodyColor: textColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}