import 'package:flutter/material.dart';
import 'package:prueba_flutter/core/theme/theme.dart';

class ButtonPositioned extends StatelessWidget {
  const ButtonPositioned({
    this.expanded,
    this.bottomToggle = 20,
    this.onPress,
  });

  final bool expanded;
  final double bottomToggle;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    const _duration = Duration(
      milliseconds: 100,
    );

    final theme = Theme.of(context);

    return expanded
        ? Container()
        : Positioned(
            bottom: bottomToggle,
            right: 20,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TestFlutterColors.blue,
              ),
              duration: _duration,
              child: TextButton(
                onPressed: onPress,
                child: Text(
                  "+",
                  style: theme.textTheme.headline4.copyWith(
                    color: TestFlutterColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
  }
}
