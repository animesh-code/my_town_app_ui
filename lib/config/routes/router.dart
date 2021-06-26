import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_town/config/app/app_config.dart';
import 'package:my_town/constants/routing_constants.dart';

class Approuter {
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case InitialRoute:
        return MaterialPageRoute(
          builder: (_) => AppConfig.composeInitialUi(),
        );
        break;
      case OtpRoute:
        if (args is String) {
          print(args);
          return MaterialPageRoute(
            builder: (_) => AppConfig.composeOtpUi(args),
            // builder: (_) => AppConfig.composeOtpUi(args),
          );
        }
        break;
      case RegisterRoute:
        return MaterialPageRoute(
          builder: (_) => AppConfig.composeRegisterUi(),
        );
      default:
        return null;
    }
  }
}
