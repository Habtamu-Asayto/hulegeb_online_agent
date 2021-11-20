import 'package:flutter/material.dart';

class BrokerHome extends StatefulWidget {
  BrokerHome({Key? key}) : super(key: key);

  @override
  _BrokerHomeState createState() => _BrokerHomeState();
}

class _BrokerHomeState extends State<BrokerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Broker Page"),
      ),
    );
  }
}
