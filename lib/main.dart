import 'package:flutter/material.dart';
import 'package:tim_archy_app/pages/access.dart';
import 'package:tim_archy_app/pages/home.dart';

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
