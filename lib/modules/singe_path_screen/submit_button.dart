import 'package:flutter/material.dart';
import 'package:moshkah_app/shared/constant/colors.dart';
import 'package:moshkah_app/shared/constant/sized_config.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
            horizontal: getProportionateScreenWidth(35),
          )),
          backgroundColor: MaterialStateProperty.all(blueColor),
        ),
        onPressed: () {
          print('enroll');
        },
        child: Text(
          'Enroll Now',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
