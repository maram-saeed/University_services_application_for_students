import 'package:flutter/material.dart';

class EmployeeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الموظف")),
      body: Center(child: Text("مرحبًا بك أيها الموظف!")),
    );
  }
}
