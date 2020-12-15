import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/screens/need/widget/button_nedd.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Perfil de usuario",
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: TopProfile(theme: theme, size: size),
            ),
            Expanded(
              flex: 2,
              child: BodyProfile(theme: theme),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            ButtonNeed(
              text: "Editar Perfil",
            )
          ],
        ),
      ),
    );
  }
}

class BodyProfile extends StatelessWidget {
  const BodyProfile({
    Key key,
    @required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        color: TestFlutterColors.blue.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Publicaciones:",
                style: theme.textTheme.subtitle1.copyWith(
                    color: TestFlutterColors.orange,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Publicación número 1",
                    style: theme.textTheme.subtitle2,
                  ),
                  Text(
                    "Publicación número 2",
                    style: theme.textTheme.subtitle2,
                  ),
                  Text(
                    "Publicación número 3",
                    style: theme.textTheme.subtitle2,
                  ),
                  Text(
                    "Publicación número 4",
                    style: theme.textTheme.subtitle2,
                  ),
                  Text(
                    "Publicación número 5",
                    style: theme.textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopProfile extends StatelessWidget {
  const TopProfile({
    Key key,
    @required this.theme,
    @required this.size,
  }) : super(key: key);

  final ThemeData theme;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: TestFlutterColors.orange,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    backgroundColor: TestFlutterColors.white,
                    radius: size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SvgPicture.asset(
                        "assets/images/excellent.svg",
                        fit: BoxFit.cover,
                        color: TestFlutterColors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: TestFlutterColors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundColor: TestFlutterColors.blue,
                      radius: size.height * 0.02,
                      child: Icon(Icons.favorite_border_outlined,
                          color: TestFlutterColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          "User",
          style: theme.textTheme.headline6.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
