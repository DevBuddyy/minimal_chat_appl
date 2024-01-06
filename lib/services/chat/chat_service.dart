import 'package:cloud_firestore/cloud_firestore.dart';

class chatservice {
// firestore instance get
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//to get user stream
/*

List<Map<String,dynamic> =
[
  {
    'email': testuser@gmail.com,
    'id': ..
  },
  {
    'email': me@gmail.com,
    'id': ..
  },
]

*/
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go through each individual
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }
}
