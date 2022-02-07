import 'package:flutter/material.dart';
import 'package:moshkah_app/modules/home_screen/body.dart';
import 'package:moshkah_app/shared/constant/sized_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    return Scaffold(
      body: HomeScreenBody(),
    );
  }
}
