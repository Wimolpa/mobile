import 'package:class_room_jj/pages/login/login_page.dart';
import 'package:class_room_jj/pages/pin_login/pin_login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLASSROOM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          //brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      // home: const PinLoginPage(),
      home: const PinLoginPage(),
    );
  }
}
