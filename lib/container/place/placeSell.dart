import 'package:flutter/material.dart';

class PlaceSell extends StatefulWidget {
  PlaceSell({Key? key}) : super(key: key);

  @override
  _PlaceSellState createState() => _PlaceSellState();
}

class _PlaceSellState extends State<PlaceSell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("House rent"),
      ),
    );
  }
}
