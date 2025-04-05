import 'package:flutter/material.dart';
import 'package:flutter_application_2/MainMenu.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            SizedBox(height: 20),
            Text("تم الدفع بنجاح!", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => MainMenu()),
                );
              },
              child: Text("الانتقال للرئيسية"),
            )
          ],
        ),
      ),
    );
  }
}
