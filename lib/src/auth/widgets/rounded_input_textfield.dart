import 'package:flutter/material.dart';
import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/auth/widgets/container_textfield.dart';

class RoundedInputField extends StatelessWidget {
  final bool password;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final Function valid;
  final TextInputType keyboard;

  const RoundedInputField({
    this.password = false,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
    this.valid,
    this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return ContainertextField(
      child: TextFormField(
        keyboardType: keyboard,
        autofocus: false,
        controller: controller,
        onChanged: onChanged,
        validator: valid,
        obscureText: password,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: TestFlutterColors.blue,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
