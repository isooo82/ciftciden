import 'package:ciftciden/ui/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // TODO: open firebase account and add firebase sdk
  // TODO: firebase sdk: login, database, etc
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CiftcidenApp());
}
