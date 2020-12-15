import 'package:flutter/material.dart';
import 'package:prueba_flutter/core/theme/theme.dart';
import 'package:prueba_flutter/src/data/in_memory_filters.dart';

class SelectedFilter extends StatefulWidget {
  @override
  _SelectedFilterState createState() => _SelectedFilterState();
}

class _SelectedFilterState extends State<SelectedFilter> {
  @override
  Widget build(BuildContext context) {
    print("builder selectedScreen");
    return Column(
      children: [
        Text(
          "Seleccione el tipo de envío",
          style: Theme.of(context).accentTextTheme.subtitle1,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              var selectedFilter = allFilter[index];
              return GestureDetector(
                onTap: () {
                  selectedFilter.isSelected = !selectedFilter.isSelected;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedFilter.isSelected
                        ? TestFlutterColors.blue.withOpacity(0.1)
                        : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      // Theme(
                      //   data: ThemeData(
                      //     unselectedWidgetColor: TestFlutterColors.orange,
                      //   ),
                      Checkbox(
                        value: selectedFilter.isSelected,
                        checkColor: TestFlutterColors.white,
                        activeColor: TestFlutterColors.orange,
                        onChanged: (isSelected) {
                          selectedFilter.isSelected =
                              !selectedFilter.isSelected;
                          setState(() {});
                        },
                      ),
                      Text(
                        selectedFilter.name,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        //!Country(city) Selected
        Text(
          "Seleccione su ciudad",
          style: Theme.of(context).accentTextTheme.subtitle1,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: allFilter.length-3,
            itemBuilder: (BuildContext context, int index) {
              var selectedFilter = allFilter[index+3];
              return GestureDetector(
                onTap: () {
                  selectedFilter.isSelected = !selectedFilter.isSelected;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedFilter.isSelected
                        ? TestFlutterColors.blue.withOpacity(0.1)
                        : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: selectedFilter.isSelected,
                        checkColor: TestFlutterColors.white,
                        activeColor: TestFlutterColors.orange,
                        onChanged: (isSelected) {
                          selectedFilter.isSelected =
                              !selectedFilter.isSelected;
                          setState(() {});
                        },
                      ),
                      Text(
                        selectedFilter.name,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
