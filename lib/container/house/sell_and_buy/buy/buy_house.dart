import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hulegeb_online_agent/container/house/sell_and_buy/buy/detail.dart';

class BuyHouse extends StatefulWidget {
  @override
  _BuyHouseState createState() => _BuyHouseState();
}

class _BuyHouseState extends State<BuyHouse> {
  int selectedIndex = 0;
  List categories = [
    "All",
    "Apartama",
    "Tower/Building",
    "Service",
    "Office",
    "L-Shape"
  ];

  late final Function press;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy House"),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.grey[300],
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 19),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
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
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(16),
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              icon: Icon(Icons.search),
                              hintText: "Search"),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3),
                        height: 30,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        left: 12,
                                        right: index == categories.length - 1
                                            ? 12
                                            : 0),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                        color: index == selectedIndex
                                            ? Colors.white.withOpacity(0.6)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Text(
                                      categories[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      ItemCard(),
                      ItemCard(),
                      ItemCard(),
                      ItemCard(),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      // color: Colors.cyan[300],
      height: 170,
      child: InkWell(
        onTap: () {
          Navigator.push(
              (context), MaterialPageRoute(builder: (context) => Detail()));
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            //Item list
            Container(
              height: 144,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.cyan[500],
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 27,
                        color: Colors.black12,
                        offset: Offset(0, 15))
                  ]),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),

            Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  height: 160,
                  width: 200,
                  child: Image.asset("images/school.jpg", fit: BoxFit.cover),
                )),

            Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                    height: 136,
                    width: MediaQuery.of(context).size.width - 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                              "This is lexious Apartama for families with cheapest price.",
                              style: Theme.of(context).textTheme.button),
                        ),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(6))),
                          child: Text("3.5 million birr",
                              style: Theme.of(context).textTheme.button),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
