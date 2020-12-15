import 'package:flutter/material.dart';
import 'package:prueba_flutter/src/screens/home/details/detail_item_screen.dart';
import 'package:prueba_flutter/src/screens/home/home_screen.dart';
import 'package:prueba_flutter/src/screens/need/need_next_screen.dart';
import 'package:prueba_flutter/src/screens/need/need_screen.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
        break;
      case '/need':
        return MaterialPageRoute(
          builder: (_) => NeedScreen(),
        );
        break;
      case '/need2':
        return MaterialPageRoute(
          builder: (_) => NeedNextScreen(),
        );
        break;
      case '/detail':
      DetailArgument argument = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => DetailItemScreen(arguments: argument),
        );
        break;
      // case '/message':
      //   return MaterialPageRoute(
      //     builder: (_) => SettingsScreen(),
      //   );
      //   break;
      // case '/favorite':
      //   return MaterialPageRoute(
      //     builder: (_) => SingleGame(),
      //   );
      //   break;
      // case '/profile':
      //   return MaterialPageRoute(
      //     builder: (_) => SingleGame(),
      //   );
      //   break;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: SafeArea(
              child: Text(
                "Route Error",
              ),
            ),
          ),
        );
    }
  }
}
