import 'package:app/models/cafe.dart';
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
      'location': location,
      'contact': contact,
      'rating': rating,
    });
  }

  // cafe list from snapshot
  List<Cafe> _cafelistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Cafe(
        cafename: doc.data['cafename'] ?? '',
        location: doc.data['location'] ?? '',
        rating: doc.data['rating'] ?? 0,
        contact: doc.data['contact'] ?? 0,
      );
    }).toList();
  }

// get cafe data
  Stream<List<Cafe>> get cafes {
    return cafeCollection.snapshots().map(_cafelistFromSnapshot);
  }
}
