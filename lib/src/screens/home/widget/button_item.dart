import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    this.textColor,
    this.buttonColor,
    this.text,
    this.onPress,
  });

  final Color textColor;
  final Color buttonColor;
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: buttonColor,
      textColor: textColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0,),
        child: Text(
          text,
          style: Theme.of(context).accentTextTheme.subtitle1.copyWith(
            color: textColor,
          ),
        ),
      ),
      onPressed: onPress,
    );
  }
}
