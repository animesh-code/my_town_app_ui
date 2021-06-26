import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';

import 'components/body.dart';

class OtpPage extends StatelessWidget {
  final String number;

  OtpPage({this.number});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "OTP Verification",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Body(number),
    );
  }
}
