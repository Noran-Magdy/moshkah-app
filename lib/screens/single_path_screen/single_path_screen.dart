import 'package:flutter/material.dart';
import 'package:moshkah_app/modules/singe_path_screen/body.dart';

class SinglePathScreen extends StatelessWidget {
  static String routeName = '/single_path';
  const SinglePathScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SinglePathBody(),
    );
  }
}
