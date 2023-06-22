import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/utiles/dbhelper.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  DbHelper dbHelper = DbHelper();

  get id => null;

  @override
  void initState() {
    super.initState();
    dbHelper.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.toNamed('/');
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text("Todo app"),
          backgroundColor: Colors.teal.shade600,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () {
                Get.toNamed('update');
              },
              onTap: () {
                dbHelper.deleteData(id: id);
              },
            );
          },
          itemCount: 10,
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
