import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference cafeCollection =
      Firestore.instance.collection('cafe');

  Future<void> updateUserData(
      String cafename, String location, int contact) async {
    return await cafeCollection.document(uid).setData({
      'cafename': cafename,
      'location': location,
      'contact': contact,
    });
  }
}
