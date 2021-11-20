// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hulegeb_online_agent/login/OTPController.dart';
import 'package:get/get.dart';
import 'package:hulegeb_online_agent/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneLogin extends StatefulWidget {
  PhoneLogin({Key? key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  //Change Language
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'አማርኛ', 'locale': Locale('am', 'ET')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text("Choose a Language"),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                        child: Text(locale[index]['name']),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  String dialCodeDigits = "+251";
  TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //Phone number
    final phoneNumberField = TextFormField(
      autofocus: false,
      controller: _phoneController,
      maxLength: 9,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      //Validation
      validator: (value) {
        RegExp regex2 = new RegExp(r'^.{9,}$');
        if (value!.isEmpty) {
          return ('pls_enter'.tr);
        }
        if (!regex2.hasMatch(value)) {
          return ('enter_valid'.tr);
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: "phone".tr,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1.0),
        ),
        labelStyle: TextStyle(
          fontSize: 16,
        ),
        prefix: Padding(
          padding: EdgeInsets.only(right: 4),
          child: Text(dialCodeDigits),
        ),
        //prefixIcon: Icon(Icons.phone),
        contentPadding: EdgeInsets.fromLTRB(12, 15, 20, 15),
        hintText: "phone".tr,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Card(
                clipBehavior: Clip.antiAlias,
                color: Colors.white70,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "app_title".tr,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 75),
                          IconButton(
                            onPressed: () {
                              buildDialog(context);
                            },
                            icon: Icon(
                              Icons.language,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 1,
                        color: Colors.white60,
                        thickness: 1,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                        child: Image.asset("images/login.jpg"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 12),
                        child: Center(
                          child: Text(
                            "message".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 400,
                        child: CountryCodePicker(
                          onChanged: (country) {
                            setState(() {
                              dialCodeDigits = country.dialCode!;
                            });
                          },
                          initialSelection: "ET",
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          favorite: ["+251", "ET", "+1", "US"],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 21, left: 21),
                        child: Column(
                          children: [
                            phoneNumberField,
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 3, bottom: 21),
                        child: Column(
                          children: [
                            //Signin with phone number
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  minimumSize: Size(double.infinity, 50),
                                ),
                                onPressed: () {
                                  checkValidation(_phoneController.text);
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.phoneAlt,
                                  color: Colors.green[400],
                                ),
                                label: Text("phone_signin".tr)),

                            SizedBox(height: 16),
                            //signin with google email account
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  minimumSize: Size(double.infinity, 50),
                                ),
                                onPressed: () {
                                  final provider =
                                      Provider.of<GoogleSignInProvider>(context,
                                          listen: false);
                                  provider.googleLogin();
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red,
                                ),
                                label: Text("google_signin".tr)),
                          ],
                        ),
                      ),
                      SizedBox(height: 30)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkValidation(String phone) async {
    if (_formKey.currentState!.validate()) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("phone", _phoneController.text);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OTPController(
              phone: _phoneController.text, codeDigits: dialCodeDigits)));
    }
  }
}
