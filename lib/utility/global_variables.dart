import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/feed_screen.dart';
import 'package:instagram_flutter/screens/search_screen.dart';

import '../screens/add_post_screen.dart';
import '../screens/profil_screen.dart';

const webScreenSize = 600;
final homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text("notification"),
  ProfilSCreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
