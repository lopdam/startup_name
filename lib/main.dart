import 'package:flutter/material.dart';
import './screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Add the 3 lines from here...
        primaryColor: Colors.deepPurpleAccent,
      ),
      title: 'Startup Name Generator',
      home: Login(),
    );
  }
}
