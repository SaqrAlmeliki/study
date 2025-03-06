import 'package:flutter/material.dart';
import 'package:study/student/terms/course_details.dart';

class DCourseDetailPage extends StatelessWidget {
  final Map<String, String> course;

  const DCourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course["name"]!),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                " مواضيع المقرر ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // عرض العناصر المحفوظة في Drawer
            ListTile(
              leading: const Icon(Icons.label, color: Colors.blueAccent),
              title: Text(" مقدمة "),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                "تفاصيل المقرر: ${course["name"]!}\nهذا المتغير سيتم تحديده من قاعدة البيانات",
                style: const TextStyle(fontSize: 20, color: Colors.blueAccent),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final courseDetailState =
                    CourseDetailPage.courseDetailKey.currentState;
                if (courseDetailState != null) {
                  courseDetailState.addDrawerItem("Yaseen");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(" تم الرفع "),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(" تم الرفع "),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text("رفع الموضوع"),
            ),
          ],
        ),
      ),
    );
  }
}
