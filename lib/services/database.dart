import 'package:app/models/cafe.dart';
import 'package:app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference cafeCollection =
      Firestore.instance.collection('cafe');

  Future updateUserData(String name, String location) async {
    return await cafeCollection.document(uid).setData({
      'name': name,
      'location': location,
    });
  }

  // cafe list from snapshot
  List<Users> _cafelistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Users(
        name: doc.data['name'] ?? '',
        location: doc.data['location'] ?? '',
      );
    }).toList();
  }

  // user data from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        cafename: snapshot.data['name'],
        location: snapshot.data['location']);
  }

// get cafe data
  Stream<List<Users>> get cafes {
    return cafeCollection.snapshots().map(_cafelistFromSnapshot);
  }

// get user doc stream

  Stream<UserData> get userData {
    return cafeCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
