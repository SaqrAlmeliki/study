import 'package:flutter/material.dart';

import 'dterm_one.dart';
import 'dterm_two.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: const DTermPages(),
  ));
}

class DTermPages extends StatelessWidget {
  const DTermPages({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // عدد التابات
      child: Scaffold(
        appBar: AppBar(
          title: const Text(" صفحة المقررات "),
          backgroundColor: Colors.blueAccent,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
            tabs: [
              Tab(text: "الترم الأول"),
              Tab(text: "الترم الثاني"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DTermOne(),
            DTermTwo(),
          ],
        ),
      ),
    );
  }
}
