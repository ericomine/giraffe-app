import 'package:flutter/material.dart';
import 'main.dart';
import 'screens/create.dart';

const String mainRoute = '/';
const String createRoute = '/create';
const String editRoute = '/edit';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        return MaterialPageRoute(builder: (_) => MainPage());
      case createRoute:
        return MaterialPageRoute(builder: (_) => CreatePage());
      case editRoute:
        return MaterialPageRoute(builder: (_) => CreatePage());
    }
  }
}
