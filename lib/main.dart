import 'package:flutter/material.dart';
import 'package:my_town/composition_root.dart';
import 'package:my_town/config/app/app_config.dart';
import 'package:my_town/config/routes/router.dart';
import 'package:my_town/config/themes/theme.dart';

void main() async {
  await AppConfig.configure();
  AppConfig.composeInitialUi();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Approuter _appRouter = Approuter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Town',
      theme: theme(),
      onGenerateRoute: _appRouter.generateRoute,
      // home: AppConfig.composeNumberUi(),
    );
  }

  @override
  void dispose() {
    AppConfig.dispose();
    super.dispose();
  }
}

// accentColor: Color.fromRGBO(255, 251, 176, 59),
//192.168.43.233