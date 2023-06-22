import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/utiles/dbhelper.dart';

import '../controller/Task_Controller.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TaskController controller = Get.put(TaskController());
  TextEditingController txttitle = TextEditingController();
  TextEditingController txtnotes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Add Data"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        DbHelper dbhelper = DbHelper();
                        String date =
                            "${controller.currentdate.value.year}/${controller.currentdate.value.month}/${controller.currentdate.value.day}";
                        dbhelper.insertData(
                            priority: "High",
                            notes: txtnotes.text,
                            date: "$date",
                            time: "${controller.currenttime.value}",
                            title: txttitle.text);
                        Get.back();
                      },
                      child: Container(
                        height: 35,
                        width: 70,
                        child: Center(
                          child: Text(
                            "High",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red.shade200,
                            borderRadius: BorderRadius.circular(30)),
                      )),
                  InkWell(
                      onTap: () {
                        DbHelper dbhelper = DbHelper();
                        String date =
                            "${controller.currentdate.value.year}/${controller.currentdate.value.month}/${controller.currentdate.value.day}";
                        dbhelper.insertData(
                            priority: "Low",
                            notes: txtnotes.text,
                            date: "$date",
                            time: "${controller.currenttime.value}",
                            title: txttitle.text);
                        Get.back();
                      },
                      child: Container(
                        height: 35,
                        width: 70,
                        child: Center(
                          child: Text(
                            "Low",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            borderRadius: BorderRadius.circular(30)),
                      )),
                  InkWell(
                    onTap: () {
                      DbHelper dbhelper = DbHelper();
                      String date =
                          "${controller.currentdate.value.year}/${controller.currentdate.value.month}/${controller.currentdate.value.day}";
                      dbhelper.insertData(
                          priority: "Urgent",
                          notes: txtnotes.text,
                          date: "$date",
                          time: "${controller.currenttime.value}",
                          title: txttitle.text);
                      Get.back();
                    },
                    child: Container(
                      height: 35,
                      width: 70,
                      child: Center(
                        child: Text(
                          "urgent",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: txttitle,
                cursorColor: Colors.teal,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  label: Text("title"),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter Notes",
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 50,
                child: TextFormField(
                  controller: txtnotes,
                  cursorColor: Colors.teal,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Choose Date",
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 45,
                width: 207,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
                child: TextButton(
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: controller.currentdate.value,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                      builder: (context, child) => Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                                primary: Color(0XFF1E2140),
                                onPrimary: Colors.white,
                                onSurface: Colors.teal),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: Color(0XFF1E2140),
                              ),
                            ),
                          ),
                          child: child!),
                    );
                    controller.setdate(date!);
                  },
                  child: Obx(
                    () => Text(
                      "${controller.currentdate.value.year}/${controller.currentdate.value.month}/${controller.currentdate.value.day}",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Choose Time",
                style: TextStyle(fontSize: 19),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () async {
                  TimeOfDay? pickedtime = await showTimePicker(
                    context: context,
                    initialTime: controller.currenttime.value,
                    builder: (context, child) => MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: false),
                        child: child!),
                  );
                  controller.currenttime.value = pickedtime!;
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(

                    border: Border.all(color: Colors.teal,),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => Align(alignment: Alignment.centerLeft,
                      child: Text(
                        "${controller.currenttime.value.hour}:${controller.currenttime.value.minute}",
                        style:
                            TextStyle(color: Colors.grey.shade700, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
