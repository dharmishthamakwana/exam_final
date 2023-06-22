import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/screens/view/home_screen.dart';
import 'package:untitled2/screens/view/update_task.dart';
import 'screens/view/add_task.dart';
import 'screens/view/spelesh_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => SpleshScreen(),
        'first': (p0) => FirstScreen(),
        'second': (p0) => AddTask(),
        'update':(p0) => UpdateTask(),
      },
    ),
  );
}
