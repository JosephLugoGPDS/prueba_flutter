import 'package:flutter/material.dart';

import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/models/item_model.dart';

class CardNeedItem extends StatelessWidget {
  final Item item;

  const CardNeedItem({this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: TestFlutterColors.dark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(children: [
          Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: TestFlutterColors.dark,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Image.asset(
                  item.image,
                ),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: TestFlutterColors.grey,
                                ),
                              ),
                              Text(
                                item.name,
                              ),
                            ],
                          ),
                          Text(
                            "21h",
                            style: TextStyle(
                                color: TestFlutterColors.grey,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(item.date),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.favorite_border_outlined,
                                      color: TestFlutterColors.blue,
                                    ),
                                    Text("1"),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.messenger_outline_sharp,
                                      color: TestFlutterColors.blue,
                                    ),
                                    Text("3"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ))
        ]));
  }
}
