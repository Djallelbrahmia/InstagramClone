import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppUser {
  final String username;
  final String uid;
  final String email;
  final String bio;
  final String photoUrl;

  final List followers;
  final List following;
  const AppUser(
      {required this.username,
      required this.uid,
      required this.email,
      required this.bio,
      required this.photoUrl,
      required this.followers,
      required this.following});
  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photourl": photoUrl,
        "bio": bio,
        "followers": followers,
        "following": following
      };
  static AppUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return AppUser(
        username: snapshot['username'],
        uid: snapshot['uid'],
        bio: snapshot['bio'],
        email: snapshot['email'],
        photoUrl: snapshot['photoUrl'],
        followers: snapshot['followers'],
        following: snapshot['following']);
  }
}
