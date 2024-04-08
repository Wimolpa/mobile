import 'package:flutter/material.dart';
import 'package:term_project/pages/homepage.dart';
import 'package:term_project/pages/homepage1.dart';
import 'package:term_project/pages/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: LoginPage(),
    );
  }
}
