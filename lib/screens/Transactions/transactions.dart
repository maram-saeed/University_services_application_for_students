import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/Transactions/Pages/CloseRecordPage.dart';
import 'package:flutter_application_2/screens/Transactions/Pages/OpenRecordPage.dart';
import 'Pages/RequestForAForm.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text("المعاملات")),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                buildTransactionButton(
                    context, OpenRecordPage(), "استمارة إعادة قيد"),
                buildTransactionButton(
                    context, CloseRecordPage(), "استمارة وقف قيد"),
                buildTransactionButton(context, RequestForAFormPage(),
                    "طلب استمارة سحب وثائق واخلاء طرف خريجين"),
                // buildTransactionButton(
                //     context, OpenRecordPage(), "طلب استخراج وثيقة"),

                // buildTransactionButton(context, OpenRecordPage(),
                //     "طلب استمارة سحب ملف لغير الخريجين"),
                // buildTransactionButton(
                //     context, OpenRecordPage(), "بيان حالة طالب"),
                // buildTransactionButton(
                //     context, OpenRecordPage(), "استمارة سحب ثانوية"),
                // buildTransactionButton(
                //     context, OpenRecordPage(), "استمارة تظلم"),
                // buildTransactionButton(context, OpenRecordPage(),
                //     "استمارة تحويل من كلية إلى كلية"),
                // buildTransactionButton(
                //     context, OpenRecordPage(), "استمارة تحويل داخل الكلية"),
              ],
            ),
          ),
        ));
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
          minimumSize:
              Size(double.infinity, 50), // يجعل الزر يملأ العرض بالكامل
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
}

class Page extends StatelessWidget {
  final String title;
  Page({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          "صفحة $title قيد التطوير",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
