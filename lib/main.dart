import 'package:flutter/material.dart';
import 'package:moshkah_app/rouets/routes.dart';
import 'package:moshkah_app/screens/home_screen/home_screen.dart';
import 'package:moshkah_app/shared/constant/theme.dart';
import 'package:moshkah_app/shared/remote/Utilities/injection_container.dart';

void main() {
  initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      // home: HomeScreen(),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
