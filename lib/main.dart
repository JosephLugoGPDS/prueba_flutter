import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:prueba_flutter/core/router/router.dart';
import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/auth/provider/auth_user_privider.dart';
import 'package:prueba_flutter/src/wrapper.dart';

import 'src/models/auth_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthUser>.value(
      value: AuthUserProvider().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter test',
        theme: lightTheme,
        // home: WelcomeScreen(),
        home: Wrapper(),
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
