import 'package:flutter/material.dart';
import 'package:space_app/screens/explore_screen/explore_screen.dart';
import 'package:space_app/screens/home_screen/home_screen.dart';
import 'package:space_app/screens/planet_details/planet_details.dart';
import 'package:space_app/theme/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space App',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.myThemeData,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ExploreScreen.routeName: (context) => ExploreScreen(),
        PlanetDetails.routeName: (context) => PlanetDetails()
      },
    );
  }
}
