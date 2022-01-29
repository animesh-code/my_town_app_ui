import 'package:flutter/material.dart';
import 'package:my_town/config/app/app_config.dart';
import 'package:my_town/config/routes/router.dart';
import 'package:my_town/config/themes/theme.dart';
import 'package:my_town/presentation/screens/main/home/home_page.dart';
import 'package:my_town/presentation/screens/main/nav_page.dart';
import 'package:my_town/presentation/screens/main/store/store_page.dart';
import 'package:my_town/ui/pages/check_otp.dart';
import 'package:my_town/ui/pages/enter_number_page.dart';
import 'package:my_town/ui/pages/product_detail_page.dart';
import 'package:my_town/ui/pages/register_page.dart';
import 'package:my_town/ui/pages/store_list_page.dart';
import 'package:my_town/ui/pages/store_ui_page.dart';
import 'package:my_town/ui/pages/test_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      title: 'Lokate',
      theme: theme(),
      // onGenerateRoute: _appRouter.generateRoute,
      home: NavPage(),
    );
  }

  @override
  void dispose() {
    AppConfig.dispose();
    super.dispose();
  }
}

// accentColor: Color.fromRGBO(255, 251, 176, 59),
// 192.168.43.233