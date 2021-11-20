import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulegeb_online_agent/container/house/sell_and_buy/buy/buy_house.dart';
import 'package:hulegeb_online_agent/container/house/sell_and_buy/sell/sell_house.dart';

class SellAndBuy extends StatefulWidget {
  @override
  _SellAndBuyState createState() => _SellAndBuyState();
}

class _SellAndBuyState extends State<SellAndBuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping House"),
        backgroundColor: Colors.grey[300],
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250.0,
                    width: double.infinity,
                    color: Colors.grey[400],
                  ),
                  Positioned(
                    bottom: 50.0,
                    right: 100.0,
                    child: Container(
                      height: 400.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200.0),
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 100.0,
                      left: 120.0,
                      child: Container(
                        height: 300.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200.0),
                          color: Colors.grey[350],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "What do you want ?",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 3,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        onPrimary: Colors.black,
                                        minimumSize: Size(double.infinity, 50),
                                        padding: EdgeInsets.only(
                                            top: 23, bottom: 23)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BuyHouse()));
                                    },
                                    icon: Icon(Icons.shopping_bag),
                                    label: Text(
                                      "Buy",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      minimumSize: Size(double.infinity, 50),
                                      padding:
                                          EdgeInsets.only(top: 23, bottom: 23),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SellHouse()));
                                    },
                                    icon: Icon(Icons.sell),
                                    label: Text(
                                      "Sell",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
