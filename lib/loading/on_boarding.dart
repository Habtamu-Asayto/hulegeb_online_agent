import 'package:flutter/material.dart';
import 'package:hulegeb_online_agent/dashboard/homePage.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
          child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Global Online agent for every one",
            body: "We have a lot of services for our customers",
            image: buildImage(
              "images/welcome.jpg",
            ),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Global Online agent for every one",
            body: "We have a lot of services for our customers",
            image: buildImage(
              "images/welcome.jpg",
            ),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Global Online agent for every one",
            body: "We have a lot of services for our customers",
            image: buildImage(
              "images/welcome.jpg",
            ),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Global Online agent for every one",
            body: "We have a lot of services for our customers",
            image: buildImage(
              "images/welcome.jpg",
            ),
            decoration: getPageDecoration(),
          ),
        ],
        done: Text("Finish", style: TextStyle(fontWeight: FontWeight.bold)),
        onDone: () => goToLogin(context),
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        next: Icon(Icons.arrow_forward),
        dotsDecorator: getDotDecoration(),
        animationDuration: 700,
        //isProgressTap: false,
        //isProgress: false,
      ));

  //

  DotsDecorator getDotDecoration() => DotsDecorator(
      size: Size(10, 10),
      activeSize: Size(18, 10),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
  void goToLogin(context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 350,
        ),
      );
  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        bodyTextStyle: TextStyle(fontSize: 19),
        imagePadding: EdgeInsets.all(21),
        pageColor: Colors.white,
      );
}
