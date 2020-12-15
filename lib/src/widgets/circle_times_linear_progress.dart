import 'package:flutter/material.dart';
import 'package:prueba_flutter/core/theme/theme.dart';

class CircleTimesLinearProgress extends StatelessWidget {

  const CircleTimesLinearProgress({this.active=true});
  final bool active;


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: active?TestFlutterColors.blue:TestFlutterColors.grey.withOpacity(0.5),
      child: active?Icon(
        Icons.check,
        color: TestFlutterColors.white,
      ):null,
    );
  }
}
