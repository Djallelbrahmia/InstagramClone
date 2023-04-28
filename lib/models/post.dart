import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;
  final List likes;

  const Post(
      {required this.username,
      required this.uid,
      required this.description,
      required this.datePublished,
      required this.postId,
      required this.profImage,
      required this.likes,
      required this.postUrl});
  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "description": description,
        "datePublished": datePublished,
        "postId": postId,
        "profImage": profImage,
        "likes": likes,
        "postUrl": postUrl,
      };
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
        username: snapshot['username'],
        uid: snapshot['uid'],
        description: snapshot['description'],
        datePublished: snapshot['datePublished'],
        postId: snapshot['postId'],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage'],
        likes: snapshot['likes']);
  }
}
