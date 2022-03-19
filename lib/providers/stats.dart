import 'package:flutter/cupertino.dart';

class Stats with ChangeNotifier {
  List<Map<String, int>> salesStats = [
    {'2020': 2},
    {'2019': 2},
  ];
}

Map<String, dynamic> a = {
  '2019': {
    'Enero': [
      120,
      320,
      430,
      805,
      541,
      129,
    ],
    'Febrero': 120,
  },
  '2039': {'Enero': 2019},
  '2029': {'Enero': 2019},
};
