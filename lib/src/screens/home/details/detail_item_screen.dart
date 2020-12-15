import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/data/in_memory_items.dart';
import 'package:prueba_flutter/src/models/item_model.dart';
import 'package:prueba_flutter/src/screens/home/widget/button_item.dart';

//!arguments
class DetailArgument {
  final int index;

  DetailArgument({this.index});
}

//!Detail
class DetailItemScreen extends StatelessWidget {
  final DetailArgument arguments;

  const DetailItemScreen({this.arguments});

  @override
  Widget build(BuildContext context) {
    List<Item> currentItem = items;
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Hero(
      tag: currentItem[arguments.index],
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CurrentImage(currentItem: currentItem, arguments: arguments, size: size),
              const SizedBox(height: 10),
              CurrentCard(size: size, theme: theme, currentItem: currentItem, arguments: arguments),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentCard extends StatelessWidget {
  const CurrentCard({
    Key key,
    @required this.size,
    @required this.theme,
    @required this.currentItem,
    @required this.arguments,
  }) : super(key: key);

  final Size size;
  final ThemeData theme;
  final List<Item> currentItem;
  final DetailArgument arguments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            child: Card(
              color: TestFlutterColors.blue.withOpacity(0.1),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              // color: Colors.red,
              child: Container(
                height: size.height * 0.35,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Portatil Mac",
                          style: theme.accentTextTheme.headline6,
                        ),
                        Text(
                          "Antofogasta",
                          style: theme.textTheme.subtitle2,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Publicado: ",
                              style: theme.textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              currentItem[arguments.index].date,
                              style: theme.textTheme.subtitle2,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Estado: ",
                              style: theme.textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/images/excellent.svg",
                              width: 18,
                              color: TestFlutterColors.blue,
                              // color: TestFlutterColors.blue,
                            ),
                            Text(
                              " " + currentItem[arguments.index].estado,
                              style: theme.textTheme.subtitle2.copyWith(
                                color: TestFlutterColors.blue,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(10),
                                  child: Image.asset(
                                    currentItem[arguments.index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // SizedBox(width: 150,),
                            ],
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          currentItem[arguments.index].description,
                          style: theme.textTheme.subtitle2.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 70,
              width: size.width,
              color: TestFlutterColors.blue.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ButtonItem(
                      text: "Preguntar",
                      buttonColor: TestFlutterColors.white,
                      onPress: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    ButtonItem(
                      text: "¡Lo quiero!",
                      buttonColor: TestFlutterColors.blue,
                      textColor: TestFlutterColors.white,
                      onPress: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentImage extends StatelessWidget {
  const CurrentImage({
    Key key,
    @required this.currentItem,
    @required this.arguments,
    @required this.size,
  }) : super(key: key);

  final List<Item> currentItem;
  final DetailArgument arguments;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Image.asset(
        currentItem[arguments.index].image,
        fit: BoxFit.cover,
        height: size.height * 0.5,
      ),
    );
  }
}
