import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hulegeb_online_agent/container/house/sell_and_buy/sell_and_buy.dart';

class RealHome extends StatefulWidget {
  RealHome({Key? key}) : super(key: key);

  @override
  _RealHomeState createState() => _RealHomeState();
}

class _RealHomeState extends State<RealHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15.0,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.account_box),
                              iconSize: 30.0,
                            ),
                          ),
                          SizedBox(width: 205),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.settings),
                              iconSize: 30.0,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 44.0,
                        width: 7,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Welcome !",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                        width: 17,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "What do you want ?",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 30,
                                ),
                                contentPadding: EdgeInsets.all(16),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 12.0),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 16),
                      designCard('House', 'Sell/Buy', 'images/school.jpg', 1),
                      SizedBox(width: 16),
                      designCard('House', 'Rent/Lease', 'images/school.jpg', 2),
                    ],
                  ),
                  SizedBox(height: 21.0),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      designCard('Vehicle', 'Sell/Buy', 'images/school.jpg', 3),
                      SizedBox(width: 16),
                      designCard(
                          'Vehicle', 'Rent/Lease', 'images/school.jpg', 4),
                    ],
                  ),
                  SizedBox(height: 21.0),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      designCard(
                          'Apartement', 'Sell/Buy', 'images/school.jpg', 5),
                      SizedBox(width: 16),
                      designCard('Place', 'Sell/Buy', 'images/school.jpg', 6),
                    ],
                  ),
                  SizedBox(height: 21.0),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      designCard('Job', 'Vacancies', 'images/school.jpg', 7),
                      SizedBox(width: 16),
                      designCard('Agent', 'Membership', 'images/school.jpg', 8),
                    ],
                  ),
                  SizedBox(height: 19),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget designCard(String title, String subTitle, String imgPath, int count) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        height: 155.0,
        width: MediaQuery.of(context).size.width / 2 - 25.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0), color: Colors.white),
        child: InkWell(
          onTap: () {
            if (count == 1) {
              print("House Mareket");
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SellAndBuy()));
            }

            if (count == 2) {
              print("House Rent");
            }

            if (count == 3) {
              print("Vehicle Rent");
            }
          },
          splashColor: Colors.blue[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                  height: 50.0,
                  width: 50.0,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  subTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
