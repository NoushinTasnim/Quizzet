import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzet/screens/join_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData.dark(),
        home: JoinScreen(),
    );
  }
}
