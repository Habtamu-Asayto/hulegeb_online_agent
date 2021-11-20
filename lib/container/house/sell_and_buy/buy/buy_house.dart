import 'package:flutter/material.dart';
import 'package:hulegeb_online_agent/container/house/sell_and_buy/buy/house_card.dart';
import 'package:hulegeb_online_agent/provider/house.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

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
    HouseProvider houseProvider = Provider.of<HouseProvider>(context);

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
                      Column(
                        children: houseProvider.houses
                            .map((item) => GestureDetector(
                                  child: HouseCard(
                                    house: item,
                                  ),
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: 27,
                      ),
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
