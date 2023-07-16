import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzet/view/join_view/screen/join_screen.dart';

Future<void> main() async {
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
