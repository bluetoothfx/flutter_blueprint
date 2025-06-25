import 'package:flutter/material.dart';
import 'package:flutter_blueprint/src/core/config/routes/routes.dart';
import 'package:flutter_blueprint/src/features/home/presentation/screens/home_screen.dart';

class RouteManager {

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const Placeholder(), //SplashScreen(),
          settings: routeSettings,
        );
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage(), settings: routeSettings);
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(builder: (_) => const Center(child: Text('Not Found')));
  }
}
