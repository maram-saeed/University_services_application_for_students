import 'package:flutter/material.dart';
import 'package:flutter_application_2/MainMenu.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/LoginScreen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String username = '';
  String email = '';
  String phone = '';
  String academicNumber = '';
  String paymentAmount = '';

  bool isNewStudent = true; // افتراضيًا، المستخدم جديد ويدفع رسوم التسجيل

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          "تسجيل جديد",
          style: TextStyle(fontFamily: 'Cairo'),
        )),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "الاسم الكامل"),
                  onSaved: (value) => fullName = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "اسم المستخدم"),
                  onSaved: (value) => username = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "البريد الإلكتروني"),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => email = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "رقم الهاتف"),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) => phone = value!,
                ),

                // اختيار إذا كان الطالب مستجدًا أم مستمرًا
                Row(
                  children: [
                    Text("هل أنت طالب مستجد؟"),
                    Switch(
                      value: isNewStudent,
                      onChanged: (value) {
                        setState(() {
                          isNewStudent = value;
                        });
                      },
                    ),
                  ],
                ),

                // إظهار إما حقل الدفع أو الرقم الأكاديمي بناءً على اختيار المستخدم
                isNewStudent
                    ? TextFormField(
                        decoration:
                            InputDecoration(labelText: "مبلغ رسوم التسجيل"),
                        keyboardType: TextInputType.number,
                        onSaved: (value) => paymentAmount = value!,
                      )
                    : TextFormField(
                        decoration:
                            InputDecoration(labelText: "الرقم الأكاديمي"),
                        keyboardType: TextInputType.number,
                        onSaved: (value) => academicNumber = value!,
                      ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print("الاسم الكامل: $fullName");
                      print("اسم المستخدم: $username");
                      print("البريد الإلكتروني: $email");
                      print("رقم الهاتف: $phone");

                      if (isNewStudent) {
                        print("مبلغ الدفع: $paymentAmount");
                      } else {
                        print("الرقم الأكاديمي: $academicNumber");
                      }

                      // يمكن استبدال هذه الطباعة بعملية حفظ البيانات أو الانتقال للصفحة الرئيسية
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainMenu()),
                      );
                    }
                  },
                  child: Text("تسجيل"),
                ),

                SizedBox(height: 10),
                TextButton(
                  child: Text(
                    "هل لديك حساب؟ تسجيل الدخول",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
