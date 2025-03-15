import 'package:flutter/material.dart';
import 'package:flutter_application_2/StudentPage/RulesOfTransactions.dart';
import 'package:flutter_application_2/screens/Transactions/transactions.dart';

class TransactionsMainPage extends StatelessWidget {
  const TransactionsMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("المعاملات وشروطها"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTransactionButton(
                context, RulesOfTransactions(), "شروط المعاملات"),
            buildTransactionButton(context, TransactionsPage(), "المعاملات"),
          ],
        ),
      ),
    );
  }
}

Widget buildTransactionButton(
    BuildContext context, Widget MyPage, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.shade300,
        elevation: 5,
        minimumSize: Size(double.infinity, 50), // يجعل الزر يملأ العرض بالكامل
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyPage),
        );
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    ),
  );
}
