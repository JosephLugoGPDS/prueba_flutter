import 'package:flutter/foundation.dart';

class Filter {
  
  Filter({
    @required this.name,
  });

  final String name;
  bool isSelected = false;
}