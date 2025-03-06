import 'package:flutter/material.dart';

import 'majors.dart';

class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
     final Map<String, String> studentData = {
      'S_id': '125756',
      'S_name': 'عيسى الجماعي',
      'S_address': 'اب ',
      'S_major': 'ماجستير '
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text("الصفحة الرئيسية"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40, bottom: 20, left: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('asset/img/IMG.jpg'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "عيسى الجماعي",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "12345",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading:
                        const Icon(Icons.looks_one, color: Colors.blueAccent),
                    title: const Text(
                      ' كلية الهندسة',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MajorsPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.looks_two, color: Colors.blueAccent),
                    title: const Text(
                      ' كلية الطب',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                    },
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.looks_3, color: Colors.blueAccent),
                    title: const Text(
                      'كلية التجارة',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              //  height: 50,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Study',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'asset/img/study-logo-inspiration-college-designs-vector-31156507.jpg',
                    width: 300,
                    height: 150,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        ' :   اسم الدكتور'  ,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        studentData['S_name'] ?? '',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'رقم الوظيفي: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        studentData['S_id'] ?? '',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'العنوان : ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        studentData['S_address'] ?? '',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        ' المؤهل العلمي : ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        studentData['S_major'] ?? '',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


