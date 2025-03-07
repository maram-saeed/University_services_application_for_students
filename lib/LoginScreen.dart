import 'package:flutter/material.dart';
import 'package:flutter_application_2/TeacherPage/TeacherPage.dart';
import 'StudentPage/StudentPage.dart';
import 'EmployeePage/EmployeePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // دالة لتحديد الصفحة المناسبة بناءً على الدور
  void navigateBasedOnRole(String role) {
    if (role == "طالب") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StudentHomePage()),
      );
    } else if (role == "مدرس") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TeacherHomePage()),
      );
    } else if (role == "موظف") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EmployeeHomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("دور المستخدم غير معروف!")),
      );
    }
  }

  // دالة تنفيذ تسجيل الدخول (تحاكي التحقق من البيانات)
  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    // هنا يمكنك جلب الدور الحقيقي من API أو قاعدة البيانات
    // افتراضياً، سنحدد الدور يدوياً لاختبار التنقل
    String userRole = "طالب"; // قم بتغيير هذا لاختبار الأدوار الأخرى

    // تنفيذ التنقل بناءً على الدور
    navigateBasedOnRole(userRole);
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
                controller: emailController,
                decoration: InputDecoration(labelText: "البريد الإلكتروني"),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "كلمة المرور"),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: login, // عند الضغط يتم تنفيذ دالة تسجيل الدخول
                child: Text("تسجيل الدخول"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// صفحات الأدوار المختلفة (يجب أن تكون موجودة في مشروعك)
// class StudentHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("الطالب")),
//       body: Center(child: Text("مرحبًا بك أيها الطالب!")),
//     );
//   }
// }

// class TeacherHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("المدرس")),
//       body: Center(child: Text("مرحبًا بك أيها المدرس!")),
//     );
//   }
// }

// class DeanHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("العميد")),
//       body: Center(child: Text("مرحبًا بك أيها العميد!")),
//     );
//   }
// }
