import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:random/firebase_options.dart';
import 'package:random/src/root.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Root());
}
