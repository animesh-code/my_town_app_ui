import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import './components/body.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Future<bool> onWillPop() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to leave the app.'),
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
        body: Body(),
      ),
    );
  }
}
