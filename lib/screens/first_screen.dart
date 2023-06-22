import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todo app"),
          backgroundColor: Colors.teal.shade600,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            Container(
              height: 200,
              width: double.infinity,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.shade600,
          onPressed: () {
            Get.toNamed('second');
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
