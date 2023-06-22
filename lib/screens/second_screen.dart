import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController txttask = TextEditingController();
  TextEditingController txtnote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Task"),
          backgroundColor: Colors.teal.shade600,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: 70,
                    child: Center(child: Text("urgent")),
                    decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 70,
                    child: Center(child: Text("high")),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 70,
                    child: Center(
                      child: Text("urgent"),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    height: 30,
                    width: 70,
                    child: Center(
                      child: Text("urgent"),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade200,
                      borderRadius: BorderRadius.circular(20),
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
              Row(
                children: [
                  Text(
                    "select date",
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      DatePickerDialog(
                        initialDate: DateTime(2023, DateTime.july),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      );
                    },
                    icon:
                        Icon(Icons.calendar_month, color: Colors.teal.shade600),
                  )
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.shade600,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
