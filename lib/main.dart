import 'package:flutter/material.dart';
import 'package:flutter_application_2/EmployeePage/EmployeePage.dart';
import 'package:flutter_application_2/LoginScreen.dart';
import 'package:flutter_application_2/StudentPage/StudentPage.dart';
import 'package:flutter_application_2/TeacherPage/TeacherPage.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيقي',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole;
  String name = '';
  String email = '';
  String password = '';
  String phone = '';
  String academicNumber = ''; // الرقم الأكاديمي للطالب
  final TextEditingController academicNumberController =
      TextEditingController(); // للتحكم في الإدخال

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text("تسجيل جديد")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "الاسم"),
                  onSaved: (value) => name = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "البريد الإلكتروني"),
                  onSaved: (value) => email = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "كلمة المرور"),
                  obscureText: true,
                  onSaved: (value) => password = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "رقم الهاتف"),
                  onSaved: (value) => phone = value!,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: "نوع المستخدم"),
                  items: ["طالب", "موظف"]
                      .map((role) =>
                          DropdownMenuItem(value: role, child: Text(role)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value;
                    });
                  },
                  onSaved: (value) => selectedRole = value,
                ),

                // إظهار حقل الرقم الأكاديمي إذا كان المستخدم طالبًا
                if (selectedRole == "طالب")
                  TextFormField(
                    controller: academicNumberController,
                    decoration: InputDecoration(labelText: "الرقم الأكاديمي"),
                    keyboardType: TextInputType.number,
                    onSaved: (value) => academicNumber = value!,
                  ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      navigateBasedOnRole(selectedRole!);
                    }
                  },
                  child: Text("تسجيل"),
                ),
                SizedBox(height: 10),
                TextButton(
                  child: Text(
                    "هل لديك حساب من قبل؟ تسجيل الدخول",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    // الانتقال إلى صفحة تسجيل الدخول
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateBasedOnRole(String role) {
    if (role == "طالب") {
      print("الرقم الأكاديمي: $academicNumber");
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
}
