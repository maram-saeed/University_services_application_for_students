import 'package:flutter/material.dart';
import 'package:flutter_application_2/StudentPage/Assignments/AssignmentsPage.dart';
import 'package:flutter_application_2/screens/Transactions/TransactionsMainPage.dart';
//import 'screens/Transactions/transactions.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("القائمة الرئيسية")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  MenuButton(title: "التكاليف", page: AssignmentsPage()),
                  MenuButton(title: "الجداول الدراسية", page: SchedulesPage()),
                  MenuButton(title: "المعاملات", page: TransactionsMainPage()),
                  MenuButton(title: "الرسوم", page: FeesPage()),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // if (index == 0) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => Test()),
          //   );
          // }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "الإشعارات"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "الملف الشخصي"),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final Widget page;

  MenuButton({required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 5,
          shadowColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(title, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

// صفحات وهمية لكل زر
class CostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text("التكاليف")),
          body: Center(child: Text("صفحة التكاليف")),
        ));
  }
}

class SchedulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text("الجداول الدراسية")),
          body: Center(child: Text("صفحة الجداول الدراسية")),
        ));
  }
}

class TransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text("المعاملات")),
          body: Center(child: Text("صفحة المعاملات")),
        ));
  }
}

class FeesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text("الرسوم")),
          body: Center(child: Text("صفحة الرسوم")),
        ));
  }
}
