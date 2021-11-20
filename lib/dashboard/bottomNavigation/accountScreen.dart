// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hulegeb_online_agent/login/phoneLogin.dart';
import 'package:hulegeb_online_agent/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    //final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged in"),
      ),
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                alignment: Alignment.center,
                color: Colors.white12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome to our App",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    SizedBox(height: 24),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                    SizedBox(height: 7),
                    Text("Name: " + user.displayName!),
                    SizedBox(height: 7),
                    Text("Email: " + user.email!),
                    Container(
                      child: ElevatedButton.icon(
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.logout();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PhoneLogin()));
                          },
                          icon: FaIcon(FontAwesomeIcons.signOutAlt),
                          label: Text("Logout")),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                child: Text("You are logged with phone number "),
              );
            }
          }),
    );
  }
}
