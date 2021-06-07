import 'package:flutter/material.dart';
import 'package:whetho/screens/CityScreen.dart';

import 'screens/LoadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: LoadingScreen.route,
      routes: {
        LoadingScreen.route: (context) => LoadingScreen(),
        CityScreen.route: (context) => CityScreen(),
      },
    );
  }
}
