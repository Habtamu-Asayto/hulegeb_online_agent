import 'package:flutter/material.dart';
import 'package:hulegeb_online_agent/models/house.dart';
import 'package:hulegeb_online_agent/services/houses.dart';

class HouseProvider with ChangeNotifier {
  HouseServices _houseServices = HouseServices();
  List<HouseModel> houses = [];

  HouseProvider.initialize() {
    loadHouse();
  }

  loadHouse() async {
    houses = await _houseServices.getHouses();
    notifyListeners();
  }
}
