import 'package:flutter/material.dart';

class CarRent extends StatefulWidget {
  CarRent({Key? key}) : super(key: key);

  @override
  _CarRentState createState() => _CarRentState();
}

class _CarRentState extends State<CarRent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Rent"),
      ),
    );
  }
}
