//@dart=2.9
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hulegeb_online_agent/ChangeLanguage/changeLanguage.dart';
//Change Language
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:hulegeb_online_agent/loading/splashScreen.dart';
import 'package:hulegeb_online_agent/provider/google_sign_in.dart';
import 'package:hulegeb_online_agent/provider/house.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Restricting from Auto-rotating
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: HouseProvider.initialize()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: GetMaterialApp(
            translations: ChangeLanguage(),
            locale: Locale('en', 'US'),
            debugShowCheckedModeBanner: false,
            title: 'Hulegeb Online Agent',
            theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),
              primarySwatch: Colors.blue,
            ),
            home: SplashScreen()),
      );
}
