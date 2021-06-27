import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';

import 'components/body.dart';

class OtpPage extends StatelessWidget {
  final String number;

  OtpPage({this.number});
  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit from the app.'),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No')),
            TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Exit')),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
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
      ),
    );
  }
}
