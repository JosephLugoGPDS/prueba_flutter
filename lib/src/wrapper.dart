import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter/src/auth/authentication.dart';
import 'package:prueba_flutter/src/models/auth_user.dart';

import 'screens/welcome_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<AuthUser>(context);

    if(user != null) {
      return WelcomeScreen();
    } else{
      return Authentication();
    }
  }
}