import 'package:flutter/material.dart';
import 'package:hulegeb_online_agent/models/house.dart';
import 'package:hulegeb_online_agent/services/houses.dart';

class HouseProvider with ChangeNotifier {
  HouseServices _houseServices = HouseServices();
  List<HouseModel> products = [];

  HouseProvider.initialize() {
    loadProducts();
  }

  loadProducts() async {
    products = await _houseServices.getProducts();
    notifyListeners();
  }
}
