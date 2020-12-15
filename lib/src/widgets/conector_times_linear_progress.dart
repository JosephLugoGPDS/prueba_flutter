import 'package:flutter/material.dart';
import 'package:prueba_flutter/core/theme/theme.dart';

class ConectorTimesLinearProgress extends StatelessWidget {

  const ConectorTimesLinearProgress({this.active=true});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 25,
      color: active?TestFlutterColors.blue:TestFlutterColors.grey.withOpacity(0.5),
    );
  }
}