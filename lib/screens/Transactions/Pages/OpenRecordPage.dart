import 'package:flutter/material.dart';
import '../Form/TransactionForm.dart';

class OpenRecordPage extends StatelessWidget {
  const OpenRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPdfForm(
      title: "استمارة إعادة القيد",
      fields: [
        {"key": "name", "label": "الاسم"},
        {"key": "nationality", "label": "الجنسية"},
        {"key": "universityNumber", "label": "الرقم الجامعي"},
        {"key": "college", "label": "الكلية"},
        {"key": "section", "label": "القسم"},
        {"key": "level", "label": "المستوى"},
        {"key": "academicStatus", "label": "الحالة الدراسية"},
        {"key": "reason", "label": "سبب إعادة القيد"},
        {"key": "semester", "label": "الفصل الدراسي"},
        {"key": "year", "label": "العام الجامعي"},
      ],
    );
  }
}
