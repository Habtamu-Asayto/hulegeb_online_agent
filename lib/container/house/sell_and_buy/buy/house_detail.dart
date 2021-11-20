import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hulegeb_online_agent/loading/loading.dart';
import 'package:hulegeb_online_agent/models/house.dart';
import 'package:transparent_image/transparent_image.dart';

class HouseDetail extends StatefulWidget {
  final HouseModel house;
  HouseDetail({Key? key, required this.house}) : super(key: key);

  @override
  _HouseDetailState createState() => _HouseDetailState();
}

class _HouseDetailState extends State<HouseDetail> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Item Detail"),
        backgroundColor: Colors.grey[300],
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey[500],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(21))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.house.images()[0],
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DotContainer(
                        fillColor: Color(0xFF80989A),
                        isSelected: true,
                      ),
                      DotContainer(
                        fillColor: Color(0xFF80989A),
                      ),
                      DotContainer(
                        fillColor: Color(0xFF80989A),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.house.houseType,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.house.initPrice.toString(),
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepOrange),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    widget.house.desc,
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  SizedBox(width: 2),
                  Container(
                    height: 50,
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.call),
                        label: Text(
                          "Call",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )),
                  ),
                  SizedBox(width: 12),
                  Container(
                    height: 50,
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.sms),
                        label: Text(
                          "SMS",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        )),
                  ),
                  SizedBox(width: 12),
                  Container(
                    height: 50,
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.favorite),
                        label: Text(
                          "Favorite",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        )),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class DotContainer extends StatelessWidget {
  const DotContainer({
    Key? key,
    required this.fillColor,
    this.isSelected = false,
  }) : super(key: key);

  final Color fillColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      padding: EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: isSelected ? Color(0xFF707070) : Colors.transparent)),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: fillColor),
      ),
    );
  }
}

class ItemPicture extends StatelessWidget {
  const ItemPicture({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      height: MediaQuery.of(context).size.width * 0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.7,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          ),
          Image.asset(
            image,
            height: MediaQuery.of(context).size.width * 0.72,
            width: MediaQuery.of(context).size.width * 0.72,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
