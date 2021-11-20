import 'package:flutter/material.dart';

class PromotionScreen extends StatefulWidget {
  PromotionScreen({Key? key}) : super(key: key);

  @override
  _PromotionScreenState createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: Text("Promotion Page"),
      ),
      body: Container(),
    );
  }
}
