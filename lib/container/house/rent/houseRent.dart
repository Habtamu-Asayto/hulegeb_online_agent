import 'package:flutter/material.dart';
import 'package:hulegeb_online_agent/dashboard/homePage.dart';

class HouseRent extends StatefulWidget {
  HouseRent({Key? key}) : super(key: key);

  @override
  _HouseRentState createState() => _HouseRentState();
}

class _HouseRentState extends State<HouseRent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black26)],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(27),
                      bottomLeft: Radius.circular(27))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                      ),
                      onTap: () {
                        Navigator.of(context).pop(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                    ),
                    Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(80)),
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 21, right: 16, top: 12),
              child: Text(
                "What do you want ?",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              margin: EdgeInsets.only(left: 6, right: 6),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                            //enableDrag: false,
                            isDismissible: false,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            context: context,
                            builder: (context) => rentBuildSheet(),
                          );
                        },
                        icon: Icon(Icons.house_rounded),
                        label: Text("Renting House"),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12)),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.other_houses),
                        label: Text("Leasing House"),
                        style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 9),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 15.0,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Here is it some houses for rent",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_time)),
                      ],
                    ),
                  ),
                  SizedBox(height: 7.0),

                  //House 1
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 1.0),
                        child: Container(
                          height: 200.0,
                          width: 325.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                image: AssetImage('images/welcome.jpg'),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                        ),
                      ),
                      Positioned(
                          top: 144.0,
                          left: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gofa, Addis Ababa",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Modern and lexurious house",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Color(0xFF353535),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.car_rental),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),

                  SizedBox(height: 16.0),
                  //House 2
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 1.0),
                        child: Container(
                          height: 200.0,
                          width: 325.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                image: AssetImage('images/school.jpg'),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                        ),
                      ),
                      Positioned(
                          top: 144.0,
                          left: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gofa, Addis Ababa",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Modern and lexurious house",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Color(0xFF353535),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.car_rental),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),

                  SizedBox(height: 16.0),
                  //House 3
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 1.0),
                        child: Container(
                          height: 200.0,
                          width: 325.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                image: AssetImage('images/welcome.jpg'),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                        ),
                      ),
                      Positioned(
                          top: 144.0,
                          left: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gofa, Addis Ababa",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Modern and lexurious house",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Color(0xFF353535),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.car_rental),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  //House 4
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 1.0),
                        child: Container(
                          height: 200.0,
                          width: 325.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                image: AssetImage('images/welcome.jpg'),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                        ),
                      ),
                      Positioned(
                          top: 144.0,
                          left: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gofa, Addis Ababa",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "Modern and lexurious house",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Color(0xFF353535),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.car_rental),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Build Bottom Sheet
  Widget rentBuildSheet() => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text("Fill required fields below"),
            ),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Submit"))
          ],
        ),
      );
}
