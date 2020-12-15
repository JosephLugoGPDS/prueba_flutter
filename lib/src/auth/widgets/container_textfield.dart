import 'package:flutter/material.dart';
import 'package:prueba_flutter/core/theme/theme.dart';

class ContainertextField extends StatelessWidget {

  final Widget child;

  const ContainertextField({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical:5),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: TestFlutterColors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}