import 'package:flutter/material.dart';

class CarSell extends StatefulWidget {
  CarSell({Key? key}) : super(key: key);

  @override
  _CarSellState createState() => _CarSellState();
}

class _CarSellState extends State<CarSell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Sell"),
      ),
    );
  }
}
