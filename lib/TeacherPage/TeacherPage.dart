import 'package:flutter/material.dart';

class TeacherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("المدرس")),
      body: Center(child: Text("مرحبًا بك أيها المدرس!")),
    );
  }
}
