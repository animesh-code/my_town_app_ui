import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';
import 'package:my_town/presentation/screens/core/auth/number/components/input_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Mobile Verification',
          style: Theme.of(context).textTheme.headline5.copyWith(
                color: kDarkColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Text(
          'We will send you an One Time Password on this mobile number',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: getProportionateScreenWidth(15.0),
              ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        InputForm(),
        SizedBox(
          height: getProportionateScreenHeight(80),
        ),
      ],
    );
  }
}
