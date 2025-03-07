import 'package:flutter/material.dart';
import 'NavigationBar.dart';

class StudentHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الصفحة الرئيسية")),
      body: NavigationBarApp(),
    );
  }
}
