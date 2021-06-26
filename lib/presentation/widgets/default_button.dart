import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;

  DefaultButton({this.text, this.press});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(
        width: SizeConfig.screenWidth - getProportionateScreenWidth(50),
        height: getProportionateScreenHeight(55),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // elevation: 1,
          primary: kPrimaryColor,
          // padding: EdgeInsets.symmetric(horizontal: 105, vertical: 18),
          textStyle: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.bold),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(fontSize: 16, letterSpacing: 1),
        ),
      ),
    );
  }
}
