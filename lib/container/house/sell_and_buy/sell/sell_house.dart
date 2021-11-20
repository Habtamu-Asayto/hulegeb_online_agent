// ignore_for_file: deprecated_member_use, unused_import
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hulegeb_online_agent/services/house.dart';
import 'package:image_picker/image_picker.dart';

class SellHouse extends StatefulWidget {
  SellHouse({Key? key}) : super(key: key);

  @override
  _SellHouseState createState() => _SellHouseState();
}

class _SellHouseState extends State<SellHouse> {
  String? _valueHouseType;
  String? _valueHouseStatus;
  //
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _houseAreaController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _initialCostController = TextEditingController();
  TextEditingController _finalCostController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  //Image Upload
  File? _image1;
  File? _image2;
  File? _image3;

  HouseService houseService = HouseService();
  bool isLoading = false;

  _imageFromCamera1() async {
    PickedFile? image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      setState(() {
        _image1 = File(image.path);
      });
    }
  }

  _imageFromCamera2() async {
    PickedFile? image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      setState(() {
        _image2 = File(image.path);
      });
    }
  }

  _imageFromCamera3() async {
    PickedFile? image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      setState(() {
        _image3 = File(image.path);
      });
    }
  }

  _imageFromGallery1() async {
    PickedFile? image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    if (image != null) {
      setState(() {
        _image1 = File(image.path);
      });
    }
  }

  _imageFromGallery2() async {
    PickedFile? image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    if (image != null) {
      setState(() {
        _image2 = File(image.path);
      });
    }
  }

  _imageFromGallery3() async {
    PickedFile? image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    if (image != null) {
      setState(() {
        _image3 = File(image.path);
      });
    }
  }

  void _showPicker1(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () {
                  _imageFromGallery1();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  _imageFromCamera1();
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
        });
  }

  void _showPicker2(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () {
                  _imageFromGallery2();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  _imageFromCamera2();
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
        });
  }

  void _showPicker3(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () {
                  _imageFromGallery3();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  _imageFromCamera3();
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
        });
  }

  Widget displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 40, 14, 40),
        child: new Icon(
          Icons.add_a_photo,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(_image3!, fit: BoxFit.fill, width: double.infinity);
    }
  }

  Widget displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 40, 14, 40),
        child: new Icon(
          Icons.add_a_photo,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(_image2!, fit: BoxFit.fill, width: double.infinity);
    }
  }

  Widget displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 40, 14, 40),
        child: new Icon(
          Icons.add_a_photo,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(_image1!, fit: BoxFit.fill, width: double.infinity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping House"),
        backgroundColor: Colors.grey[300],
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 19),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: isLoading
          ? LinearProgressIndicator()
          : ListView(
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
                          padding: const EdgeInsets.all(11.0),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15.0),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "House Detail",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 0.0, top: 3),
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 12.0, right: 12.0),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: OutlineButton(
                                                        onPressed: () {
                                                          _showPicker1(context);
                                                        },
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.8),
                                                            width: 2.0),
                                                        child: displayChild1(),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: OutlineButton(
                                                          onPressed: () {
                                                            _showPicker2(
                                                                context);
                                                          },
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.8),
                                                              width: 2.0),
                                                          child:
                                                              displayChild2()),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: OutlineButton(
                                                        onPressed: () {
                                                          _showPicker3(context);
                                                        },
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.8),
                                                            width: 2.0),
                                                        child: displayChild3(),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(7),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    controller:
                                                        _houseAreaController,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return ("Please enter area of the house");
                                                      }
                                                      return null;
                                                    },
                                                    keyboardType:
                                                        TextInputType.name,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Enter area of the house(square.)",
                                                        labelText: "Area",
                                                        border:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            1)),
                                                        labelStyle: TextStyle(
                                                          fontSize: 16,
                                                        )),
                                                  ),
                                                  SizedBox(height: 16),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 5,
                                                            bottom: 5,
                                                            top: 5),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black38,
                                                          width: 2.0),
                                                    ),
                                                    child:
                                                        DropdownButton<String>(
                                                      items: [
                                                        DropdownMenuItem(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text("Villa")
                                                            ],
                                                          ),
                                                          value: "Villa",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text("G+1")
                                                            ],
                                                          ),
                                                          value: "G+1",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text("Office")
                                                            ],
                                                          ),
                                                          value: "Office",
                                                        )
                                                      ],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _valueHouseType =
                                                              value!;
                                                        });
                                                      },
                                                      isExpanded: true,
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black),
                                                      hint: Text(
                                                          "Select house type "),
                                                      value: _valueHouseType,
                                                    ),
                                                  ),
                                                  SizedBox(height: 16),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 5,
                                                            bottom: 5,
                                                            top: 5),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black38,
                                                          width: 2.0),
                                                    ),
                                                    child:
                                                        DropdownButton<String>(
                                                      items: [
                                                        DropdownMenuItem(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text("New")
                                                            ],
                                                          ),
                                                          value: "New",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text("Normal")
                                                            ],
                                                          ),
                                                          value: "Normal",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text("Old")
                                                            ],
                                                          ),
                                                          value: "Old",
                                                        )
                                                      ],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _valueHouseStatus =
                                                              value!;
                                                        });
                                                      },
                                                      isExpanded: true,
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black),
                                                      hint: Text(
                                                          "Select house status "),
                                                      value: _valueHouseStatus,
                                                    ),
                                                  ),
                                                  SizedBox(height: 19),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            0.12 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                        child: TextFormField(
                                                          controller:
                                                              _initialCostController,
                                                          validator: (value) {
                                                            RegExp regex2 =
                                                                new RegExp(
                                                                    r'^.{10,}$');
                                                            if (value!
                                                                .isEmpty) {
                                                              return ("Please enter Initial price ");
                                                            }
                                                            if (!RegExp("^[0-9]")
                                                                    .hasMatch(
                                                                        value) &&
                                                                !regex2.hasMatch(
                                                                    value)) {
                                                              return ("Please fill valid price");
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      "Initial cost",
                                                                  labelText:
                                                                      "initial cost",
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              1)),
                                                                  labelStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        19,
                                                                  )),
                                                        ),
                                                      ),
                                                      SizedBox(width: 11),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            0.1 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                        child: TextFormField(
                                                          controller:
                                                              _finalCostController,
                                                          validator: (value) {
                                                            RegExp regex2 =
                                                                new RegExp(
                                                                    r'^.{10,}$');
                                                            if (value!
                                                                .isEmpty) {
                                                              return ("Please enter Final price ");
                                                            }
                                                            if (!RegExp("^[0-9]")
                                                                    .hasMatch(
                                                                        value) &&
                                                                !regex2.hasMatch(
                                                                    value)) {
                                                              return ("Please fill valid price");
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      "Final price",
                                                                  labelText:
                                                                      "Final price",
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              1)),
                                                                  labelStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        19,
                                                                  )),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 16),
                                                  TextFormField(
                                                    controller:
                                                        _descriptionController,
                                                    keyboardType:
                                                        TextInputType.name,
                                                    maxLines: 3,
                                                    decoration: InputDecoration(
                                                        hintText: "Description",
                                                        labelText:
                                                            "Description",
                                                        border:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            1)),
                                                        labelStyle: TextStyle(
                                                          fontSize: 19,
                                                        )),
                                                  ),
                                                  SizedBox(height: 16),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Personal Detail",
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 16),
                                                  TextFormField(
                                                    controller:
                                                        _fullnameController,
                                                    validator: (value) {
                                                      RegExp regex = new RegExp(
                                                          r'^.{4,}$');
                                                      if (value!.isEmpty) {
                                                        return ("Please enter fullname ");
                                                      }
                                                      if (!regex
                                                          .hasMatch(value)) {
                                                        return ("Enter valid fullname");
                                                      }
                                                      return null;
                                                    },
                                                    keyboardType:
                                                        TextInputType.name,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Enter your Fullname",
                                                        labelText: "Fullname",
                                                        border:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            1)),
                                                        labelStyle: TextStyle(
                                                          fontSize: 16,
                                                        )),
                                                  ),
                                                  SizedBox(height: 16),
                                                  TextFormField(
                                                    controller:
                                                        _phoneController,
                                                    validator: (value) {
                                                      RegExp regex2 =
                                                          new RegExp(
                                                              r'^.{10,}$');
                                                      if (value!.isEmpty) {
                                                        return ("Please enter phone number ");
                                                      }
                                                      if (!RegExp("^[0-9]")
                                                              .hasMatch(
                                                                  value) &&
                                                          !regex2.hasMatch(
                                                              value)) {
                                                        return ("Please fill valid phone number");
                                                      }
                                                      return null;
                                                    },
                                                    keyboardType:
                                                        TextInputType.name,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Enter your phone number",
                                                        labelText:
                                                            "Phone number",
                                                        border:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            1)),
                                                        labelStyle: TextStyle(
                                                          fontSize: 16,
                                                        )),
                                                  ),
                                                  SizedBox(height: 16),
                                                  TextFormField(
                                                    controller:
                                                        _emailController,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return ("Please enter your email address");
                                                      }
                                                      if (!RegExp(
                                                              "^[a-zA_Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-z]")
                                                          .hasMatch(value)) {
                                                        return ("Please fill valid email");
                                                      }
                                                      return null;
                                                    },
                                                    keyboardType:
                                                        TextInputType.name,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Enter your Email address",
                                                        labelText:
                                                            "Email address",
                                                        border:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            1)),
                                                        labelStyle: TextStyle(
                                                          fontSize: 16,
                                                        )),
                                                  ),
                                                  SizedBox(height: 16),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            10,
                                                    height: 50,
                                                    child: ElevatedButton.icon(
                                                        onPressed: () {
                                                          validateAndUpdate();
                                                        },
                                                        icon: Icon(Icons.save),
                                                        label: Text(
                                                          "Save",
                                                          style: TextStyle(
                                                              fontSize: 19,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
    );
  }

  Future uploadImage1(File _image1) async {
    Reference reference1 = FirebaseStorage.instance.ref().child('/houses');
    await reference1.putFile(_image1);
  }

  Future uploadImage2(File _image2) async {
    Reference reference2 = FirebaseStorage.instance.ref().child('/houses');
    await reference2.putFile(_image2);
  }

  Future uploadImage3(File _image3) async {
    Reference reference3 = FirebaseStorage.instance.ref().child('/houses');
    await reference3.putFile(_image3);
  }

  void validateAndUpdate() async {
    var connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.none) {
      return AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.RIGHSLIDE,
              title: "No Internet Connection",
              desc: "Please check your internet connection(Wifi or Data)")
          .show();
    } else {
      if (_formKey.currentState!.validate()) {
        setState(() => isLoading = true);
        if (_image1 != null && _image2 != null && _image3 != null) {
          String imageUrl1;
          String imageUrl2;
          String imageUrl3;
          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 =
              "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          UploadTask task1 = storage.ref().child(picture1).putFile(_image1!);

          final String picture2 =
              "2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          UploadTask task2 = storage.ref().child(picture2).putFile(_image2!);

          final String picture3 =
              "3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          UploadTask task3 = storage.ref().child(picture3).putFile(_image3!);

          TaskSnapshot snapshot1 = await task1.whenComplete(() {
            uploadImage1(_image1!);
          });
          TaskSnapshot snapshot2 = await task2.whenComplete(() {
            uploadImage1(_image2!);
          });
          TaskSnapshot snapshot3 = await task3.whenComplete(() {
            uploadImage1(_image3!);
          });

          task3.whenComplete(() async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();
            imageUrl2 = await snapshot2.ref.getDownloadURL();
            imageUrl3 = await snapshot3.ref.getDownloadURL();
            List<String> imageList = [imageUrl1, imageUrl2, imageUrl3];
            houseService.uploadHouse(
                houseArea: _houseAreaController.text,
                houseType: _valueHouseType.toString().trim(),
                houseStatus: _valueHouseStatus.toString().trim(),
                initPrice: double.parse(_initialCostController.text),
                finPrice: double.parse(_finalCostController.text),
                desc: _descriptionController.text,
                fullname: _fullnameController.text,
                phone: _phoneController.text,
                images: imageList,
                email: _emailController.text);
            //_formKey.currentState!.reset();
            setState(() => isLoading = false);
            return AwesomeDialog(
                    context: context,
                    dialogType: DialogType.SUCCES,
                    animType: AnimType.TOPSLIDE,
                    title: "House recorded successfully",
                    desc: '')
                .show();
          });
        } else {
          setState(() => isLoading = false);
          Fluttertoast.showToast(msg: "Please select Images");
        }
      }
    }
  }
}
