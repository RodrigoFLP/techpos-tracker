import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/business_data.dart';

class User with ChangeNotifier {
  String userId;
  String name;
  DateTime birthDate;
  String location;
  List<Business> businesses;
  String selectedBusiness;

  User({
    this.userId,
    this.name,
    this.birthDate,
    this.location,
    this.businesses,
  });
}

Map<String, dynamic> a = {
  "name": "Francisco López",
  "isEnabled": true,
  "birthDate": "aaa",
  "type": "admin",
  "businesses": {
    "0": {
      "name": "Pancho's Villa",
      "type": "Restaurante",
      "location": "Santa Ana",
      "isFranchise": true,
      "initialDataDate": "a",
      "branches": {
        "0": {
          "Location": "Santa Ana",
          "initialDataDate": "a",
        },
        "1": {
          "Location": "San Salvador",
          "initialDataDate": "a",
        },
      }
    },
    "1": {
      "name": "TechPos",
      "type": "Almacen",
      "location": "Santa Ana",
      "isFranchise": false,
      "initialDataDate": "a",
      "branches": null,
    },
  },
};
