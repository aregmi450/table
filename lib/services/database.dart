import 'package:app/models/cafe.dart';
<<<<<<< HEAD
import 'package:app/models/user.dart';
=======
>>>>>>> a9e96c581e9dd354dd674f695dda14ee401b9d0e
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
<<<<<<< HEAD
=======
      'location': location,
      'contact': contact,
>>>>>>> a9e96c581e9dd354dd674f695dda14ee401b9d0e
      'rating': rating,
    });
  }

  // cafe list from snapshot
  List<Cafe> _cafelistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Cafe(
        cafename: doc.data['cafename'] ?? '',
<<<<<<< HEAD
        rating: doc.data['rating'] ?? 0,
=======
        location: doc.data['location'] ?? '',
        rating: doc.data['rating'] ?? 0,
        contact: doc.data['contact'] ?? 0,
>>>>>>> a9e96c581e9dd354dd674f695dda14ee401b9d0e
      );
    }).toList();
  }

<<<<<<< HEAD
  // user data from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        cafename: snapshot.data['cafename'],
        rating: snapshot.data['rating']);
  }

=======
>>>>>>> a9e96c581e9dd354dd674f695dda14ee401b9d0e
// get cafe data
  Stream<List<Cafe>> get cafes {
    return cafeCollection.snapshots().map(_cafelistFromSnapshot);
  }
<<<<<<< HEAD

// get user doc stream

  Stream<UserData> get userData {
    return cafeCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
=======
>>>>>>> a9e96c581e9dd354dd674f695dda14ee401b9d0e
}
