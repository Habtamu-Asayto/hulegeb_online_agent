import 'package:flutter/material.dart';

class ApartmentRent extends StatefulWidget {
  ApartmentRent({Key? key}) : super(key: key);

  @override
  _ApartmentRentState createState() => _ApartmentRentState();
}

class _ApartmentRentState extends State<ApartmentRent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apartment rent"),
      ),
    );
  }
}
