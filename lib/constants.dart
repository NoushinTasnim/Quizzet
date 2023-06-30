import 'package:flutter/material.dart';

const kbgBoxDeco = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffa35dda),
      Color(0xffe684ae),
    ],
  ),
  image: DecorationImage(
  image: AssetImage('images/bg_pattern.png'),
  opacity: 0.5,
  fit: BoxFit.cover,
  ),
);