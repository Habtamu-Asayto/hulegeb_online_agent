import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hulegeb_online_agent/dashboard/homePage.dart';
import 'package:hulegeb_online_agent/login/phoneLogin.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPController extends StatefulWidget {
  final String phone;
  final String codeDigits;

  OTPController({required this.phone, required this.codeDigits});

  @override
  _OTPControllerState createState() => _OTPControllerState();
}

class _OTPControllerState extends State<OTPController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController = TextEditingController();
  final FocusNode _pinOTPCodeFocus = FocusNode();
  String? verificationCode;

  bool showLoading = true;

  final BoxDecoration pinOTPCodedecoration = BoxDecoration(
      color: Colors.blue[100],
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey,
      ));

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${widget.codeDigits + widget.phone}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        setState(() {
          showLoading = false;
        });
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) async {
        setState(() {
          showLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message.toString()),
          duration: Duration(seconds: 3),
        ));
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.remove("phone");

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PhoneLogin()));
      },
      codeSent: (String vID, int? resendToken) {
        setState(() {
          showLoading = false;
          verificationCode = vID;
        });
      },
      codeAutoRetrievalTimeout: (String vID) async {
        setState(() {
          showLoading = false;
          verificationCode = vID;
        });
      },
      timeout: Duration(seconds: 30),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("verify".tr),
      ),
      body: showLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/otp.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        verifyPhoneNumber();
                      },
                      child: Text(
                        "ver".tr + " : ${widget.codeDigits}-${widget.phone}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: PinPut(
                    fieldsCount: 6,
                    textStyle: TextStyle(fontSize: 25, color: Colors.white),
                    eachFieldWidth: 40.0,
                    eachFieldHeight: 55.0,
                    focusNode: _pinOTPCodeFocus,
                    controller: _pinOTPCodeController,
                    submittedFieldDecoration: pinOTPCodedecoration,
                    selectedFieldDecoration: pinOTPCodedecoration,
                    followingFieldDecoration: pinOTPCodedecoration,
                    pinAnimationType: PinAnimationType.rotation,
                    keyboardType: TextInputType.phone,
                    onSubmit: (pin) async {
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: verificationCode!,
                                smsCode: pin))
                            .then((value) async {
                          if (value.user != null) {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            preferences.getString("phone");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage()));
                          } else {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            preferences.remove("phone");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PhoneLogin()));
                          }
                        });
                      } catch (e) {
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("invalid_otp".tr),
                          duration: Duration(seconds: 3),
                        ));
                      }
                    },
                  ),
                )
              ],
            ),
    );
  }
}
