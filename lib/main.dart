import 'package:flutter/material.dart';
import 'package:prueba_flutter/core/router/router.dart';
import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test',
      theme: lightTheme,
      home: WelcomeScreen(),
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
