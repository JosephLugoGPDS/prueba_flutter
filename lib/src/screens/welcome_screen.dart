import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/screens/home/home_screen.dart';
import 'package:prueba_flutter/src/screens/need/need_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TestFlutterColors.white,
      body: Column(
        children: [
          Expanded(
              child: IndexedStack(
            index: currentIndex,
            children: [
              HomeScreen(),
              Text("Message"),
              NeedScreen(),
              Text("Favorite"),
              Text("Profile")
            ],
          )),
          _NavigationBarCustom(
            index: currentIndex,
            onIndexSelected: (index) {
              setState(() => currentIndex = index);
            },
          ),
        ],
      ),
    );
  }
}

class _NavigationBarCustom extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;

  const _NavigationBarCustom({
    this.index,
    this.onIndexSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: index == 0
                    ? TestFlutterColors.blue
                    : TestFlutterColors.dark,
              ),
              onPressed: () => onIndexSelected(0),
            ),
          ),
        ),
        Expanded(
          child: Material(
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/message.svg",
                color: index == 1
                    ? TestFlutterColors.blue
                    : TestFlutterColors.dark,
              ),
              onPressed: () => onIndexSelected(1),
            ),
          ),
        ),
        Expanded(
          child: Material(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == 2
                            ? TestFlutterColors.blue
                            : TestFlutterColors.orange,
                ),
                  padding: const EdgeInsets.all(5.0),
                // child: Padding(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: theme.scaffoldBackgroundColor,
                    ),
                    child: IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/add.svg",
                        color: index == 2
                            ? TestFlutterColors.blue
                            : TestFlutterColors.orange,
                      ),
                      onPressed: () => onIndexSelected(2),
                    ),
                  ),
                ),
              ),
            ),
        Expanded(
          child: Material(
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/favorite.svg",
                color: index == 3
                    ? TestFlutterColors.blue
                    : TestFlutterColors.dark,
              ),
              onPressed: () => onIndexSelected(3),
            ),
          ),
        ),
        Expanded(
          child: Material(
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/profile.svg",
                color: index == 4
                    ? TestFlutterColors.blue
                    : TestFlutterColors.dark,
              ),
              onPressed: () => onIndexSelected(4),
            ),
          ),
        ),
      ],
    );
  }
}
