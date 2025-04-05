import 'package:flutter/material.dart';
import 'package:flutter_application_2/MainMenu.dart';
import 'package:flutter_application_2/LoginScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:html' as html; // لإعادة التوجيه للويب
// import 'package:web/web.dart';
// import 'dart:js_interop';

import 'package:url_launcher/url_launcher.dart';

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
  String major = '';
  String term = '';
  String level = '';
  String birthDate = '';
  String address = '';
  String nationality = '';
  String college = '';
  String isNewStudent = 'نعم'; // افتراضيًا، الطالب مستجد

  List<dynamic> students = [];
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _studyCaseController = TextEditingController();
  final TextEditingController _registrationDateController =
      TextEditingController();
  final TextEditingController _collegeController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _termController = TextEditingController();
  final TextEditingController _academicNumberController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    try {
      fetchStudents();
    } catch (e, stacktrace) {
      print("💥 خطأ في fetchStudents: $e");
      print(stacktrace);
    }
  }

  Future<void> fetchStudents() async {
    final url = Uri.parse("http://localhost:3000/students");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          students = json.decode(response.body);
        });
      } else {
        print("خطأ أثناء جلب الطلاب: \${response.statusCode}");
      }
    } catch (e) {
      print("خطأ: $e");
    }
  }

  Future<void> addStudent() async {
    final url = Uri.parse("http://localhost:3000/students");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "student_name": _nameController.text,
          "student_email": _emailController.text,
          "birth_date": _birthController.text,
          "username": _usernameController.text,
          "password": _passwordController.text,
          "student_phone": _phoneController.text,
          "student_address": _addressController.text,
          "student_nationality": _nationalityController.text,
          "study_case": _studyCaseController.text,
          "registration_date": _registrationDateController.text,
          "student_college": _collegeController.text,
          "student_major": _majorController.text,
          "student_level": _levelController.text,
          "student_term": _termController.text,
          "academic_number": _academicNumberController.text
        }),
      );

      if (response.statusCode == 200) {
        fetchStudents();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم التسجيل بنجاح")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("فشل في التسجيل")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("حدث خطأ أثناء الاتصال بالخادم")),
      );
    }
  }

  Future<void> redirectToStripeCheckout() async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/create-checkout-session'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'amount': int.parse(paymentAmount),
          'successUrl': 'http://localhost:5000/success',
          'cancelUrl': 'http://localhost:5000/cancel',
        }),
      );

      final data = json.decode(response.body);
      final checkoutUrl = data['checkoutUrl'];

      if (checkoutUrl != null) {
        // توجيه المستخدم إلى صفحة الدفع
        // تجاهل التحذيرات في IDE: هذا يعمل على الويب فقط
        // ignore: unsafe_html
        html.window.location.href = checkoutUrl;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("فشل إنشاء جلسة الدفع: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            title: Text("تسجيل جديد", style: TextStyle(fontFamily: 'Cairo'))),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "الاسم الكامل")),
                TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: "اسم المستخدم")),
                TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: "البريد الإلكتروني"),
                    keyboardType: TextInputType.emailAddress),
                TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: "رقم الهاتف"),
                    keyboardType: TextInputType.phone),
                TextFormField(
                    controller: _birthController,
                    decoration: InputDecoration(labelText: "تاريخ الميلاد")),
                TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(labelText: "العنوان")),
                TextFormField(
                    controller: _nationalityController,
                    decoration: InputDecoration(labelText: "الجنسية")),
                TextFormField(
                    controller: _collegeController,
                    decoration: InputDecoration(labelText: "الكلية")),
                TextFormField(
                    controller: _majorController,
                    decoration: InputDecoration(labelText: "التخصص")),
                TextFormField(
                    controller: _levelController,
                    decoration: InputDecoration(labelText: "المستوى")),
                TextFormField(
                    controller: _termController,
                    decoration: InputDecoration(labelText: "الترم")),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: "هل أنت طالب مستجد؟"),
                  value: isNewStudent,
                  items: ["نعم", "لا"].map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (value) => setState(() => isNewStudent = value!),
                ),
                isNewStudent == "نعم"
                    ? TextFormField(
                        decoration:
                            InputDecoration(labelText: "مبلغ رسوم التسجيل"),
                        keyboardType: TextInputType.number,
                        onSaved: (value) => paymentAmount = value!,
                      )
                    : TextFormField(
                        controller: _academicNumberController,
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

                      if (isNewStudent == "نعم" &&
                          paymentAmount.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("الرجاء إدخال مبلغ رسوم التسجيل")),
                        );
                        return;
                      }

                      if (isNewStudent == "نعم") {
                        redirectToStripeCheckout();
                      } else {
                        addStudent();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainMenu()),
                        );
                      }
                    }
                  },
                  child: Text("تسجيل"),
                ),
                SizedBox(height: 10),
                TextButton(
                  child: Text("هل لديك حساب؟ تسجيل الدخول",
                      style: TextStyle(color: Colors.blue)),
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
