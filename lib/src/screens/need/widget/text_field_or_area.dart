import 'package:flutter/material.dart';
import 'package:prueba_flutter/core/theme/theme.dart';

class TextFieldOrArea extends StatelessWidget {

  final bool textArea;
  final String hintText;

  const TextFieldOrArea({this.textArea = false,this.hintText}) ;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: TestFlutterColors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        child: TextField(
          maxLines: textArea?5:1,
          decoration: InputDecoration(
            hintText: " "+hintText,
            hintStyle: theme.textTheme.subtitle1.copyWith(
              color: TestFlutterColors.grey,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}