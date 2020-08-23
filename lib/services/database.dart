import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference cafeCollection =
      Firestore.instance.collection('cafe');

  Future<void> updateUserData(
      String cafename, String name, String location, int contact) async {
    return await cafeCollection.document(uid).setData({
      'cafename': cafename,
      'name': name,
      'location': location,
      'contact': contact,
    });
  }
}
