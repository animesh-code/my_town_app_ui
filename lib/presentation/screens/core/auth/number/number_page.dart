import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/presentation/screens/core/auth/number/components/body.dart';

class NumberPage extends StatelessWidget {
  // final IVerifyService _verifyService;

  // NumberPage(this._verifyService);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            getProportionateScreenHeight(25),
          ),
          child: Body(),
        ),
      ),
    );
  }
}
