import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/screens/first_screen.dart';
import 'screens/second_screen.dart';
import 'screens/spelesh_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => SpleshScreen(),
        'first': (p0) => FirstScreen(),
        'second': (p0) => AddTask(),
      },
    ),
  );
}
