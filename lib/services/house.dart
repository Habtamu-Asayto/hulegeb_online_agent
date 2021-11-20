// ignore_for_file: invalid_required_positional_param

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class HouseService {
  //Insert House information
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String ref = "houses";
  void uploadHouse(
      {required String houseArea,
      required double initPrice,
      required String houseType,
      required String houseStatus,
      required double finPrice,
      required String desc,
      required String fullname,
      required String phone,
      required List<String> images,
      required String email}) {
    var id = Uuid();
    String houseId = id.v1();
    _firestore.collection(ref).doc(houseId).set({
      'id': houseId,
      'area': houseArea,
      'house_type': houseType,
      'house_Status': houseStatus,
      'init_price': initPrice,
      'fin_price': finPrice,
      'desc': desc,
      'fullname': fullname,
      'phone': phone,
      'images': images,
      'email': email
    });
  }
}
