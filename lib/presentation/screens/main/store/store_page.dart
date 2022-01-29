import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';
import 'package:my_town/presentation/screens/main/store/components/body.dart';
import 'package:my_town/presentation/widgets/custom_app_bar.dart';
import 'package:my_town/presentation/widgets/drawer_widget.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: CustomAppBar(
          title: Text(
            'Grocery',
            style: TextStyle(
              color: kDarkColor,
              fontSize: getProportionateScreenHeight(18),
            ),
          ),
          appBar: AppBar(),
        ),
        body: Body(),
      ),
    );
  }
}
