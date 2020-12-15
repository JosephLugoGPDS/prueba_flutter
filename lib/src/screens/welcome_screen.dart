import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/screens/home/home_screen.dart';
import 'package:prueba_flutter/src/screens/need/need_main_screen.dart';
import 'package:prueba_flutter/src/screens/profile/profile_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
                HomeScreen(),
                Text("Message"),
                NeedMainScreen(),
                Text("Favorite"),
                ProfileScreen(),
              ],
            ),
          ),
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

    return Container(
      decoration: BoxDecoration(
        color: TestFlutterColors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
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
                Text(
                  "Inicio",
                  style: theme.textTheme.caption.copyWith(
                    color: index == 0
                        ? TestFlutterColors.blue
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
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
                Text(
                  "Mensajes",
                  style: theme.textTheme.caption.copyWith(
                    color: index == 1
                        ? TestFlutterColors.blue
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              // padding: const EdgeInsets.all(0),
              child: SvgPicture.asset(
                "assets/icons/add.svg",
                fit: BoxFit.fitHeight,
                height: 50,
                color: index == 2
                    ? TestFlutterColors.blue
                    : TestFlutterColors.orange,
              ),
              onTap: () => onIndexSelected(2),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
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
                Text(
                  "Favoritos",
                  style: theme.textTheme.caption.copyWith(
                    color: index == 3
                        ? TestFlutterColors.blue
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
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
                Text(
                  "Usuario",
                  style: theme.textTheme.caption.copyWith(
                    color: index == 4
                        ? TestFlutterColors.blue
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
