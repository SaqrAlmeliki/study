// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:study/doctor/dhome.dart';
import 'package:study/student/shome.dart';

import '../shared/colors.dart';
import '../shared/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final academicNumberController = TextEditingController();
  final securityCodeController = TextEditingController();
  bool isLoading = false;

  // قائمة الجامعات
  List<String> universities = [
    "جامعة الجزيرة",
    "جامعة  العلوم والتكنلوجيا",
    "جامعة القلم",
    "جامعة الوطنية",
    "جامعة اب",
    "جامعة صنعاء",
    "جامعة القران",
    "جامعة جبلة",
  ];

  String? selectedUniversity; // لتخزين الجامعة المختارة
  String? selectedLoginType; // لتخزين نوع التسجيل (طالب أو دكتور)

  @override
  void dispose() {
    academicNumberController.dispose();
    securityCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text("تسجيل الدخول"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 64),

                // اختيار الجامعة من قائمة منسدلة
                DropdownButtonFormField<String>(
                  decoration: decorationTextfiled.copyWith(
                    hintText: "اختر جامعتك",
                  ),
                  value: selectedUniversity,
                  items: universities.map((String university) {
                    return DropdownMenuItem<String>(
                      value: university,
                      child: Text(university),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedUniversity = value;
                    });
                  },
                ),

                const SizedBox(height: 33),

                // اختيار نوع التسجيل باستخدام Radio Buttons
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text("طالب"),
                        value: "طالب",
                        groupValue: selectedLoginType,
                        onChanged: (value) {
                          setState(() {
                            selectedLoginType = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text("دكتور"),
                        value: "دكتور",
                        groupValue: selectedLoginType,
                        onChanged: (value) {
                          setState(() {
                            selectedLoginType = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 33),

                // حقل الرقم الأكاديمي
                TextField(
                  controller: academicNumberController,
                  keyboardType: TextInputType.number, //
                  decoration: decorationTextfiled.copyWith(
                    hintText: "الرقم الأكاديمي",
                  ),
                ),

                const SizedBox(height: 33),

                // حقل رمز الأمان
                TextField(
                  controller: securityCodeController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: decorationTextfiled.copyWith(
                    hintText: "رمز الأمان",
                    suffixIcon: Icon(Icons.lock),
                  ),
                ),

                const SizedBox(height: 33),

                // زر تسجيل الدخول
                ElevatedButton(
                  onPressed: () {
                    if (selectedUniversity == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("الرجاء اختيار الجامعة")),
                      );
                      return;
                    }
                    if (selectedLoginType == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("الرجاء اختيار نوع التسجيل")),
                      );
                      return;
                    }
                    // يمكن إضافة تحقق إضافي للحقول الأخرى إذا لزم الأمر
                    if (selectedLoginType == "دكتور") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoctorHomePage(), // الشاشة الرئيسية بعد تسجيل الدخول
                        ),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StudentHomePage(), // الشاشة الرئيسية بعد تسجيل الدخول
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color(0xff1877f2),
                    ),
                    padding: WidgetStateProperty.all(
                      EdgeInsets.all(12),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "تسجيل الدخول",
                          style: TextStyle(fontSize: 19),
                        ),
                ),

                const SizedBox(height: 9),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
