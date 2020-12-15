import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {

  const CustomRichText({this.textTitle, this.textContent});

  final String textTitle;
  final String textContent;

  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: textTitle,
            style: theme.accentTextTheme.subtitle1,
          ),
          TextSpan(
            text: textContent,
            style: theme.textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}