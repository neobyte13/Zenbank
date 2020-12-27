import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zenbank/app.dart';
import 'package:zenbank/utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await sharedPrefs.init();
  runApp(App());
}
