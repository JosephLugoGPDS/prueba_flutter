import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prueba_flutter/core/theme/theme.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitSquareCircle(
          color: TestFlutterColors.blue,
          size: 50,
        ),
      ),
    );
  }
}