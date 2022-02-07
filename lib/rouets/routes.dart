import 'package:flutter/cupertino.dart';
import 'package:moshkah_app/screens/home_screen/home_screen.dart';
import 'package:moshkah_app/screens/single_path_screen/single_path_screen.dart';

Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  SinglePathScreen.routeName: (context) => SinglePathScreen(),
};
