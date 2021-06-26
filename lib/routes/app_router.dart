import 'package:flutter/material.dart';
import 'package:my_town/composition_root.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => CompositionRoot.composeNumberUi(),
        );
        break;
      case '/otp':
        final args = routeSettings.arguments as Map<String, String>;
        final number = args['number'];
        return MaterialPageRoute(
          builder: (_) => CompositionRoot.composeOtpUi(number),
        );
        break;
      case '/register':
        return MaterialPageRoute(
            builder: (_) => CompositionRoot.composeRegisterUi());
      default:
        return null;
    }
  }
}
