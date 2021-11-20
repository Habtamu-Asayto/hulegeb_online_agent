import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hulegeb_online_agent/models/house.dart';

class HouseServices {
  String collection = "houses";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<HouseModel>> getHouses() async =>
      _firestore.collection(collection).get().then((result) {
        List<HouseModel> houses = [];
        for (DocumentSnapshot house in result.docs) {
          houses.add(HouseModel.fromSnapshot(house));
        }
        return houses;
      });
}
