import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hulegeb_online_agent/models/house.dart';

class HouseServices {
  String collection = "houses";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //FirebaseStorage _firestore2 = FirebaseStorage.instance;

  Future<List<HouseModel>> getProducts() async =>
      _firestore.collection(collection).doc().get().then((result) {
        List<HouseModel> houses = [];
        for (DocumentSnapshot product in result.get(collection)) {
          houses.add(HouseModel.fromSnapshot(product));
        }
        return houses;
      });
}
