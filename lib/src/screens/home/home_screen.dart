import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/rendering.dart';

import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/data/in_memory_filters.dart';
import 'package:prueba_flutter/src/data/in_memory_items.dart';
import 'package:prueba_flutter/src/helpers/any_selected_filter.dart';
import 'package:prueba_flutter/src/helpers/input_border.dart';
import 'package:prueba_flutter/src/models/item_model.dart';
import 'package:prueba_flutter/src/screens/home/details/detail_item_screen.dart';
import 'package:prueba_flutter/src/screens/home/widget/selected_filter_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //!Function selected current settings
  void openFilter(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          final theme = Theme.of(context);
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: TestFlutterColors.white,
            title: Center(
              child: Text(
                "Filtros para su búsqueda",
                style: theme.accentTextTheme.headline6.copyWith(),
              ),
            ),
            actions: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: TestFlutterColors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  child: Text(
                    "OK".toUpperCase(),
                    style: theme.textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: TestFlutterColors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                ),
              ),
            ],
            content: Container(
              width: 300,
              height: 400,
              child: SelectedFilter(),
            ),
          );
        },
      );

  //!animation controller
  final scrollController = ScrollController();
  bool expanded = false;

  void _onScroll() {
    // print(scrollController.position.userScrollDirection);
    // print(expanded);
    if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse &&
        expanded == true) {
      setState(() => expanded = false);
    } else if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward &&
        expanded == false) {
      setState(() => expanded = true);
    }
  }

  //!Widget Home Screen
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    print("builder HomeScreen");

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0, right: 10, left: 10),
            child: expanded
                ? Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  "assets/images/search.svg",
                                  color: TestFlutterColors.blue,
                                  fit: BoxFit.cover,
                                  width: 20,
                                ),
                              ),
                            ),
                            labelStyle: theme.textTheme.subtitle1.copyWith(
                              color: TestFlutterColors.blue,
                            ),
                            hintText: "Qué deseas buscar?",
                            hintStyle: theme.textTheme.subtitle1.copyWith(
                              color: TestFlutterColors.grey,
                            ),
                            border: inputBorder,
                            // disabledBorder: inputBorder,
                            enabledBorder: inputBorder,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      GestureDetector(
                        child: SvgPicture.asset(
                          "assets/images/settings.svg",
                          color: TestFlutterColors.orange,
                          height: 60,
                        ),
                        onTap: () => openFilter(context),
                      ),
                    ],
                  )
                : const SizedBox(),
          ),

          expanded ? SelectedFilters() : const SizedBox(),
          //!List Images
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                _onScroll();
                return true;
              },
              child: StaggeredGridView.countBuilder(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                crossAxisCount: 2,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  return Hero(
                    tag: item,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          "/detail",
                          arguments: DetailArgument(index: index),
                        );
                      },
                      child: _Item(item: item),
                    ),
                  );
                },
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(1, index.isEven ? 1 : 1.5),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedFilters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: anySelected(allFilter) ? 60 : 10,
      child: ListView.builder(
        itemBuilder: (_, int index) {
          final itemBottomFilter = allFilter[index];
          return itemBottomFilter.isSelected
              ? Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 10,
                  decoration: BoxDecoration(
                    color: TestFlutterColors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      itemBottomFilter.name,
                    ),
                  ),
                )
              : const Divider();
        },
        scrollDirection: Axis.horizontal,
        itemCount: allFilter.length,
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}

//!Widget item selected
class _Item extends StatelessWidget {
  final Item item;

  const _Item({this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        item.image,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
