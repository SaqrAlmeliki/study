
import 'package:flutter/material.dart';
import 'package:study/DB/sqflite.dart';

class Mysql extends StatefulWidget {
  const Mysql({Key? key}) : super(key: key);

  @override
  State<Mysql> createState() => _MysqlState();
}

class _MysqlState extends State<Mysql> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
String? studentData;
  String? x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // زر لعرض البيانات من جدول الطلاب
            ElevatedButton(
              onPressed: () async {
                var result = await dbHelper.readData("SELECT * FROM major");
                print("Result: $result");
                setState(() {
                  studentData = result.toString();
                });
              },
              child: const Text("Show Info"),
            ),
            const SizedBox(height: 16),
            // زر لإدراج بيانات طالب
            ElevatedButton(
              onPressed: () async {
                var insertResult = await dbHelper.addData(
                  "INSERT INTO student (name, address, major) VALUES ('saqr', 'ibb', 5)",
                );
                print("Insert result: $insertResult");
              },
              child: const Text("Insert"),
            ),
        ElevatedButton(
              onPressed: () async {
                var insertResult = await dbHelper.addData(
                  "INSERT INTO major (name) VALUES ('saqr')",
                );
                print("Insert result: $insertResult");
                setState(() {
                  
                });
              },
              child: const Text("Insert Data"),
            ),

            const SizedBox(height: 16),
            // عرض البيانات إن وجدت باستخدام ListView
            // studentData != null
            //     ? Expanded(
            //         child: ListView.builder(
            //           itemCount: studentData!.length,
            //           itemBuilder: (context, index) {
            //             final student = studentData![index];
            //             return ListTile(
            //               title: Text("Name: ${student['name']}"),
            //               subtitle: Text(
            //                   "Address: ${student['address']} | Major: ${student['major']}"),
            //             );
            //           },
            //         ),
            //       )
                // : const Text("No data available"),

Text(studentData.toString())

          ],

        ),
      ),
    );
  }
}