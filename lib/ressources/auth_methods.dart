import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter/models/user.dart';
import 'package:instagram_flutter/ressources/storage/storage_methods.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<AppUser> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return AppUser.fromSnap(snap);
  }

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          username.isNotEmpty) {
        final UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        final photoUrl = await StorageMethods()
            .uploadImageToStorage('profilPics', file, false);
        AppUser user = AppUser(
            username: username,
            uid: cred.user!.uid,
            email: email,
            bio: bio,
            photoUrl: photoUrl,
            followers: [],
            following: []);
        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );
        res = "Succes";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = "Sucess";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
