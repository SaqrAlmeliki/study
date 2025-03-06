import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseDetailPage extends StatefulWidget {
  final Map<String, String> course;

  // مفتاح GlobalKey للوصول إلى الحالة
  static final GlobalKey<_CourseDetailPageState> courseDetailKey = GlobalKey();

  const CourseDetailPage({super.key, required this.course});

  @override
  _CourseDetailPageState createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  List<String> drawerItems = [];

  @override
  void initState() {
    super.initState();
    _loadDrawerItems(); // تحميل البيانات المحفوظة عند فتح الصفحة
  }

  // حفظ العناصر في SharedPreferences
  Future<void> _saveDrawerItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'drawer_items_${widget.course["name"]}', drawerItems);
  }

  // تحميل العناصر من SharedPreferences
  Future<void> _loadDrawerItems() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      drawerItems =
          prefs.getStringList('drawer_items_${widget.course["name"]}') ?? [];
    });
  }

  // دالة لإضافة عنصر جديد إلى الـ Drawer
  void addDrawerItem(String? itemName) {
    setState(() {
      drawerItems.add(itemName!);
    });
    _saveDrawerItems(); // حفظ التغييرات بعد الإضافة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: CourseDetailPage.courseDetailKey,
      appBar: AppBar(
        title: Text(widget.course["name"]!),
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
            // ListTile(
            //   leading: const Icon(Icons.label, color: Colors.blueAccent),
            //   title: Text(" مقدمة "),
            //   onTap: () {},
            // ),
            // عرض العناصر المحفوظة في Drawer
            ...drawerItems.map(
              (item) => ListTile(
                leading: const Icon(Icons.label, color: Colors.blueAccent),
                title: Text(item),
                onTap: () {},
              ),
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
                "تفاصيل المقرر: ${widget.course["name"]!}\nهذا المتغير سيتم تحديده من قاعدة البيانات",
                style: const TextStyle(fontSize: 20, color: Colors.blueAccent),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
