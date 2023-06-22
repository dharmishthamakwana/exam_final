import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/utiles/dbhelper.dart';

class TaskController extends GetxController {
  RxList<Map> readToList = <Map>[].obs;
  Rx<DateTime> currentdate = DateTime.now().obs;
  Rx<TimeOfDay> currenttime = TimeOfDay.now().obs;
  void setdate(DateTime date) {
    currentdate.value = date;
  }

  void readData() async {
    DbHelper dbHelper = DbHelper();
    readToList.value = await dbHelper.readData();
    print(readToList);
  }

  void DeleteData(int id) {
    DbHelper dbHelper = DbHelper();
    dbHelper.deleteData(id: id);
    readData();
  }

  void UpdateData(
      {required String priority,
        required String notes,
        required String date,
        required String time,
        required String title,
        required int id}) {
    DbHelper dbHelper = DbHelper();
    dbHelper.updateDate(
        priority: priority,
        notes: notes,
        date: date,
        time: time,
        title: title,
        id: id);
    readData();
  }
}