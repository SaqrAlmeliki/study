import 'package:flutter/material.dart';

import 'terms/dterm.dart';

class MajorsPage extends StatelessWidget {
  // قائمة افتراضية للمقررات مع أسماء وصور (تأكد من وجود الصور داخل assets/images/)
  final List<Map<String, String>> courses = [
    {"name": " تقنسة معلومات ", "image": "asset/img/IMG.jpg"},
    {"name": "ذكاء اصطناعي", "image": "asset/img/IMG.jpg"},
    {"name": "أمن سيبراني", "image": "asset/img/IMG.jpg"},
    {"name": " هندسة معماري", "image": "asset/img/IMG.jpg"},
    {"name": " هندسة مدني", "image": "asset/img/IMG.jpg"},
    // يمكن إضافة المزيد حسب الحاجة
  ];

  MajorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: courses.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // عدد الأعمدة
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final course = courses[index];
            return GestureDetector(
              onTap: () {
                // قم بوضع الإجراء المطلوب هنا
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DTermPages(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // دائرة الصورة الخاصة بالمقرر الدراسي
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(course["image"]!),
                    ),
                    const SizedBox(height: 8),
                    // اسم المقرر الدراسي
                    Text(
                      course["name"]!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
