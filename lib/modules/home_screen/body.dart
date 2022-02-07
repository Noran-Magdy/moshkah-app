import 'package:flutter/material.dart';
import 'package:moshkah_app/modules/home_screen/build_row_header.dart';
import 'package:moshkah_app/shared/constant/colors.dart';
import 'package:moshkah_app/shared/constant/sized_config.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizedConfig.screenHeight,
      width: SizedConfig.screenWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(35),
          ),
          Text(
            'Inspections',
            style: TextStyle(
              color: blueColor,
              fontSize: 34,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          BuildRowHeader(),
        ],
      ),
    );
  }
}
