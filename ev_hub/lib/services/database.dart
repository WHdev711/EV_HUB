import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addData(userData) async {
    Firestore.instance.collection("users").add(userData).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return Firestore.instance.collection("users").snapshots();
  }

  getUserInfo(String email) async {
    return Firestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();
  }

  Future<QuerySnapshot> getRecentUsers() async {
    return await Firestore.instance.collection("users").limit(10).getDocuments();
  }
}
