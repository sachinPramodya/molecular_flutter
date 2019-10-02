import 'package:flutter/material.dart';
import 'package:flutter_molecular_chat/screens/auth/login.dart';


void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter chat',
      home: Login(),
    );
  }
}
