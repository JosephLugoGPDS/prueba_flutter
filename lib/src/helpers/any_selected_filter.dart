
import 'package:prueba_flutter/src/models/filter_model.dart';

bool anySelected(List<Filter> listFilter) {
  bool _selected = false;
  for (var i = 0; i < listFilter.length; i++) {
    _selected? i = listFilter.length: _selected=listFilter[i].isSelected;
  }
  return _selected;
}