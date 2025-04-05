import 'package:flutter/material.dart';

class ConditionsWidget extends StatefulWidget {
  final String title;
  final List<String> conditions;

  ConditionsWidget({required this.title, required this.conditions});

  @override
  _ConditionsWidgetState createState() => _ConditionsWidgetState();
}

class _ConditionsWidgetState extends State<ConditionsWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: isExpanded ? null : 0, // إخفاء النص عند عدم التوسيع
          child: Visibility(
            visible: isExpanded,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.conditions.map((condition) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text("• $condition", style: TextStyle(fontSize: 16)),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Divider(), // خط فاصل بين كل قسم
      ],
    );
  }
}
