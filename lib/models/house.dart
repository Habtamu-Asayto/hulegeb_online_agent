import 'package:cloud_firestore/cloud_firestore.dart';

class HouseModel {
  static const ID = "id";
  static const FullNAME = "fullname";
  static const EMAIL = "image";
  static const PHONE = "phone";
  static const AREA = "area";
  static const DESC = "desc";
  static const INIT_PRICE = "init_price";
  static const FIN_PRICE = "fin_price";
  static const HOUSE_STATUS = "house_status";
  static const HOUSE_TYPE = "house_type";
  static const IMAGES = "images";
  static const FEATURED = "featured";

  late String _id;
  late String _fullname;
  late String _email;
  late String _phone;
  late String _area;
  late String _desc;
  late double _initPrice;
  late double _finPrice;
  late String _houseStatus;
  late String _houseType;
  late List _images;
  late bool _featured;

  String get id => _id;
  String get fullname => _fullname;
  String get email => _email;
  String get phone => _phone;
  String get area => _area;
  String get desc => _desc;
  double get initPrice => _initPrice;
  double get finPrice => _finPrice;
  String get houseType => _houseType;
  String get houseStatus => _houseStatus;
  List get images => _images;
  bool get featured => _featured;

  HouseModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = (snapshot.data() as dynamic)[ID];
    _area = (snapshot.data() as dynamic)[AREA];
    _desc = (snapshot.data() as dynamic)[DESC];
    _email = (snapshot.data() as dynamic)[EMAIL];
    _finPrice = (snapshot.data() as dynamic)[FIN_PRICE];
    _fullname = (snapshot.data() as dynamic)[FullNAME];
    _houseStatus = (snapshot.data() as dynamic)[HOUSE_STATUS];
    _houseType = (snapshot.data() as dynamic)[HOUSE_TYPE];
    _images = (snapshot.data() as dynamic)[IMAGES];
    _phone = (snapshot.data() as dynamic)[PHONE];
    _initPrice = (snapshot.data() as dynamic)[INIT_PRICE];
    _featured = (snapshot.data() as dynamic)[FEATURED];
  }
}
