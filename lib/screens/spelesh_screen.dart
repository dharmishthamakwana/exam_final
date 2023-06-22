import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        Get.toNamed('first');
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
