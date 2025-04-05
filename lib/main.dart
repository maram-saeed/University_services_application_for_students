import 'package:flutter/material.dart';
import 'package:flutter_application_2/payment/SuccessScreen.dart';
import './screens/signUp/signUp.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
/**
 * 
 * الجداول الدراسية ينشأها مسؤول النظام
 */

void main() async {
  print("🌟 التطبيق بدأ!");
  // ErrorWidget.builder = (FlutterErrorDetails details) {
  //   return Material(
  //     child: Center(
  //       child: Text(
  //         'حدث خطأ:\n${details.exceptionAsString()}',
  //         style: TextStyle(color: Colors.red),
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // };
  // WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey =
  //     'pk_test_51PQ9irP7KSleQUvLje5xiOUsceksPlhX7fezvWTmKMaBdbNyzYo4I12Txbp0qkUvKxg1S8abOyYALlM6gM06t7jb00qzCNH0IR'; // مفتاح Stripe العام
  //await Stripe.instance.applySettings();

//   routes: {
//   '/success': (context) => SuccessScreen();
//   //'/cancel': (context) => CancelScreen(), // أنشئها إن أردت
// }
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق تقديم الخدمات الجامعية عبر الجوال',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Cairo'),
      home: RegistrationScreen(),
    );
  }
}
