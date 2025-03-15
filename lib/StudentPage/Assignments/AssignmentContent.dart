import 'package:flutter/material.dart';

class AssignmentContent extends StatelessWidget {
  const AssignmentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text("محتوى التكليف")),
          body: Center(child: Text("صفحة التكليف")),
        ));
  }
}
