import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundAuth extends StatelessWidget {

  const BackgroundAuth({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              SvgPicture.asset(
                "assets/images/logo.svg"
              ),
              child,
            ],
          ),
        ),
    );
  }
}