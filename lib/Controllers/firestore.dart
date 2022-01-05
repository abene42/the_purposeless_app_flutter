import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreUtil {
  static Future<QuerySnapshot> getUserSnapshotWithEmail(
      {required String email}) async {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection('users');

    QuerySnapshot? userSnapshot =
        await userRef.where('email', isEqualTo: email).limit(1).get();

    return userSnapshot;
  }

  static Future<Object?> firstOrCreateUser({required User user}) async {
    QuerySnapshot? userCheckResult =
        await getUserSnapshotWithEmail(email: user.email!);

    if (userCheckResult.docs.isNotEmpty) {
      return userCheckResult.docs.first.data();
    } else {
      CollectionReference userRef =
          FirebaseFirestore.instance.collection('users');

      // Map<>

      var firestoreUser = await userRef.add({
        'email': user.email,
        'photoURL': user.photoURL,
        'displayName': user.displayName,
        'phoneNumber': user.phoneNumber,
        'uid': user.uid,
      });

      return firestoreUser;
    }
  }
}
