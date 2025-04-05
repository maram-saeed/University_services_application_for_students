import 'package:flutter/material.dart';

class StudentProfileScreen extends StatefulWidget {
  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  String profileImage = 'assets/default_profile.png'; // الصورة الافتراضية

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text("الملف الشخصي")),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(profileImage),
                      ),
                      SizedBox(height: 10),
                      Text("أحمد محمد",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      Text("ahmed.student@gmail.com",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 10)),
                    ],
                  ),
                ),
                _buildDrawerItem(Icons.school, "النتائج", () {}),
                _buildDrawerItem(
                    Icons.event_available, "الحضور والغياب", () {}),
                _buildDrawerItem(Icons.credit_card, "البطاقة الجامعية", () {}),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // إضافة وظيفة تغيير الصورة لاحقًا
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(profileImage),
                  ),
                ),
                SizedBox(height: 10),
                Text("أحمد محمد",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text("ahmed.student@gmail.com",
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text("Ahmed_Student",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ));
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: onTap,
    );
  }
}
