import 'dart:async';
import 'package:flutter/material.dart';
import 'package:study/DB/db_helper.dart';
import 'login.dart';

class MySplashscreen extends StatefulWidget {
  const MySplashscreen({super.key});

  @override
  State<MySplashscreen> createState() => _MySplashscreenState();
}

class _MySplashscreenState extends State<MySplashscreen> {
  @override
  void initState() {
    DatabaseHelper db = DatabaseHelper();
    db.insertStudent({
      'student_password': "king",
      'student_id': 1234,
      'student_name': "saqr Almeliki",
      'major_id': 1,
      'address': "Ibb",
    });
    db.insertDoctor({
      'doctor_password': '123',
      'doctor_job_number': 1,
      'doctor_name': 'Easa Aljomaee',
      'doctor_qualification': 'Flutter Dev',
      'address': 'Ibb',
    });
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
          (route) => false,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color.fromARGB(240, 10, 20, 30),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("asset/img/study1.jpg"),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Welcome to Study",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
