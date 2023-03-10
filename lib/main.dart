import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/Screens/access.dart';
import 'package:tim_archy_app/UI/Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AccessPage(),
      );
  }
}
