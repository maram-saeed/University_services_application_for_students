import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentPage extends StatefulWidget {
  final int amount;
  const PaymentPage({Key? key, required this.amount}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  Future<void> makePayment() async {
    setState(() => isLoading = true);

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/create-payment-intent'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'amount': widget.amount}),
      );

      final data = json.decode(response.body);
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: data['clientSecret'],
          merchantDisplayName: 'اسم الجامعة',
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم الدفع بنجاح')),
      );

      Navigator.pop(context, true); // الرجوع مع نتيجة النجاح
    } catch (e, stacktrace) {
      print("🚨 فشل الدفع: $e");
      print(stacktrace);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل الدفع: $e')),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      makePayment();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("تم بناء صفحة الدفع");
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text('الدفع')),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Icon(Icons.check_circle, color: Colors.green, size: 80),
      ),
    );
  }
}
