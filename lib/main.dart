import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterchat_app/screens/home.dart';
import 'package:flutterchat_app/screens/reg.dart';
import 'package:flutterchat_app/screens/chat.dart';
import 'package:flutterchat_app/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      initialRoute: "home",
      routes: {
        "home": (context) => Myhome(),
        "reg": (context) => MyReg(),
        "login": (context) => Mylogin(),
        "chat": (context) => Mychat(),
      },
    ),
  );
}
