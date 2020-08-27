import 'package:app/models/cafe.dart';
import 'package:app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference cafeCollection =
      Firestore.instance.collection('cafe');

  Future updateUserData(
      String cafename, String location, int contact, int rating) async {
    return await cafeCollection.document(uid).setData({
      'cafename': cafename,
      'rating': rating,
    });
  }

  // cafe list from snapshot
  List<Cafe> _cafelistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Cafe(
        cafename: doc.data['cafename'] ?? '',
        rating: doc.data['rating'] ?? 0,
      );
    }).toList();
  }

  // user data from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        cafename: snapshot.data['cafename'],
        rating: snapshot.data['rating']);
  }

// get cafe data
  Stream<List<Cafe>> get cafes {
    return cafeCollection.snapshots().map(_cafelistFromSnapshot);
  }

// get user doc stream

  Stream<UserData> get userData {
    return cafeCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
