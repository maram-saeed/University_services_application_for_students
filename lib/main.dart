import 'package:flutter/material.dart';
import './screens/signUp/signUp.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Cairo'),
      home: RegistrationScreen(),
    );
  }
}
