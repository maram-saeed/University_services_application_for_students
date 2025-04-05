import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html; // لإعادة التوجيه في الويب

class PaymentWebPage extends StatelessWidget {
  final int amount;

  PaymentWebPage({required this.amount});

  Future<void> redirectToCheckout(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/create-checkout-session'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'amount': amount}),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      html.window.location.href = jsonResponse['url'];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("فشل إنشاء جلسة الدفع")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الدفع")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => redirectToCheckout(context),
          child: Text("ادفع الآن"),
        ),
      ),
    );
  }
}
