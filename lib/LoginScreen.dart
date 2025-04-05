import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  // دالة تسجيل الدخول والتحقق من البيانات من قاعدة البيانات
  Future<void> login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("يرجى إدخال اسم المستخدم وكلمة المرور")),
      );
      return;
    }

    setState(() {
      isLoading = true; // إظهار مؤشر التحميل
    });

    try {
      final response = await http.post(
        Uri.parse("http://localhost:3000/studentlogin"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "password": password}),
      );

      final data = jsonDecode(response.body);

      if (data["success"]) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"])),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("حدث خطأ أثناء الاتصال بالسيرفر")),
      );
    }

    setState(() {
      isLoading = false; // إخفاء مؤشر التحميل
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text("تسجيل الدخول")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: "اسم المستخدم"),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "كلمة المرور"),
                obscureText: true,
              ),
              SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: login, // استدعاء الدالة الجديدة
                      child: Text("تسجيل الدخول"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
