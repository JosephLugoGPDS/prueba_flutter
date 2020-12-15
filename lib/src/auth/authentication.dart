import 'package:flutter/material.dart';
import 'package:prueba_flutter/src/auth/screens/signin_screen.dart';
import 'package:prueba_flutter/src/auth/screens/signup_screen.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  bool mostrarLogin = true;

  void toggleView() {
    setState(() => mostrarLogin =!mostrarLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (mostrarLogin) {
      return SigninScreen(toggleView: toggleView,);
    } else {
      return SignupScreen(toggleView: toggleView,);
    }
  }
}