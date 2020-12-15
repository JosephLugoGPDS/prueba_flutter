import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/data/in_memory_items.dart';
import 'package:prueba_flutter/src/screens/need/widget/card_need.dart';
import 'package:prueba_flutter/src/widgets/button_positioned_add.dart';

class NeedMainScreen extends StatefulWidget {
  @override
  _NeedMainScreenState createState() => _NeedMainScreenState();
}

class _NeedMainScreenState extends State<NeedMainScreen> {
  final scrollController = ScrollController();
  bool expanded = false;

  void _onScroll() {
    if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse &&
        expanded == false) {
      setState(() => expanded = true);
    } else if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward &&
        expanded == true) {
      setState(() => expanded = false);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: TestFlutterColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yo necesito"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.countertops_rounded),
            color: TestFlutterColors.blue,
          ),
          // SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send_rounded),
            color: TestFlutterColors.blue,
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                _onScroll();
                return true;
              },
              child: GridView.builder(
                controller: scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 20,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  return CardNeedItem(item: item);
                },
              ),
            ),
          ),
          ButtonPositioned(
            expanded: expanded,
            onPress: (){
              Navigator.of(context).pushNamed("/need");
            },
          ),
        ],
      ),
    );
  }
}
