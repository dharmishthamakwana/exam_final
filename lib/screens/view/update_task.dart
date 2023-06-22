import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/utiles/dbhelper.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({Key? key}) : super(key: key);

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  TextEditingController txttask = TextEditingController();
  TextEditingController txtnote = TextEditingController();
  TextEditingController txtdate = TextEditingController(text: "22/06/23");
  TextEditingController txtpriority = TextEditingController();
  TextEditingController txttime = TextEditingController();

  DbHelper dbHelper = DbHelper();

  get id => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.toNamed('first');
              },
              child: Icon(Icons.arrow_back)),
          title: Text("Update Task"),
          backgroundColor: Colors.teal.shade600,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 70,
                      child: Center(child: Text("urgent")),
                      decoration: BoxDecoration(
                        color: Colors.red.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 70,
                      child: Center(child: Text("high")),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 70,
                      child: Center(
                        child: Text("urgent"),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.orange.shade200,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txttask,
                decoration: InputDecoration(
                  label: Text(
                    "title",
                    style: TextStyle(color: Colors.teal.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal.shade600),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtnote,
                decoration: InputDecoration(
                  label: Text("note",
                      style: TextStyle(color: Colors.teal.shade600)),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal.shade600),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.teal.shade900)),
                child: TextButton(
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime(2023),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "22/06/2023",
                    ),
                  ),
                ),
              ),
              TextField(
                controller: txttime,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.schedule,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.shade600,
          onPressed: () {
            dbHelper.updateDate(
                title: txttask.value,
                date: txtdate.value,
                id: id,
                notes: txtnote.value,
                priority: txtpriority.value,
                time: txttime.value);
            Get.back();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
