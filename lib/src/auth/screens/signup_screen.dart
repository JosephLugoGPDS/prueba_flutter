import 'package:flutter/material.dart';
import 'package:prueba_flutter/src/auth/provider/auth_user_privider.dart';

import 'package:prueba_flutter/src/auth/widgets/background_auth.dart';
import 'package:prueba_flutter/src/auth/widgets/rounded_input_textfield.dart';
import 'package:prueba_flutter/src/helpers/loading.dart';
import 'package:prueba_flutter/src/screens/need/widget/button_nedd.dart';

class SignupScreen extends StatefulWidget {
  //function toggle
  const SignupScreen({this.toggleView});
  final Function toggleView;

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthUserProvider _auth = AuthUserProvider();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String name = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return loading
        ? Loading()
        : Scaffold(
            body: BackgroundAuth(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 40),
                            RoundedInputField(
                              hintText: "nombres",
                              valid: (val) =>
                                  val.isEmpty ? 'Ingrese su nombre' : null,
                              onChanged: (val) {
                                name = val.trim();
                                setState(() {});
                              },
                            ),
                            RoundedInputField(
                              hintText: "ejemplo@ejemplo.com",
                              icon: Icons.email,
                              keyboard: TextInputType.emailAddress,
                              valid: (val) =>
                                  val.isEmpty ? 'Ingrese su email' : null,
                              onChanged: (val) {
                                email = val.trim();
                                setState(() {});
                              },
                            ),
                            RoundedInputField(
                              password: true,
                              hintText: "constraseña",
                              icon: Icons.visibility,
                              valid: (val) => val.length < 6
                                  ? 'contraseña de 6 caracteres'
                                  : null,
                              onChanged: (val) {
                                password = val.trim();
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ButtonNeed(
                      text: 'Registrarse'.toUpperCase(),
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result =
                              await _auth.createUserWithEmailAndPassword(
                                  email, password, name);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'Ingrese datos correctos';
                            });
                          }
                        }
                      },
                    ),
                    FlatButton(
                      child: Text(
                        "Ya tengo una cuenta",
                        style: theme.textTheme.subtitle1,
                      ),
                      onPressed: () {
                        widget.toggleView();
                      },
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      error,
                      style: theme.textTheme.caption.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
