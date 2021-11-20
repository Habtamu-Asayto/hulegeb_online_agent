import 'package:flutter/material.dart';
import 'package:hulegeb_online_agent/container/house/sell_and_buy/buy/house_detail.dart';
import 'package:hulegeb_online_agent/loading/loading.dart';
import 'package:hulegeb_online_agent/models/house.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:transparent_image/transparent_image.dart';

class HouseCard extends StatelessWidget {
  final HouseModel house;
  const HouseCard({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      // color: Colors.cyan[300],
      height: 170,
      child: InkWell(
        onTap: () {
          Navigator.push(
              (context),
              MaterialPageRoute(
                  builder: (context) => HouseDetail(
                        house: house,
                      )));
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

            Positioned.fill(
                left: 140,
                top: 30,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(height: 160, width: 180, child: Loading()),
                )),
            Positioned(
                top: 12,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  height: 160,
                  width: 200,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: house.images()[0],
                    fit: BoxFit.cover,
                  ),
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
                          child: Text("${house.desc}",
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
                          child: Text("${house.initPrice}",
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
