import 'package:flutter/material.dart';
import '../Form/TransactionForm.dart';

class CloseRecordPage extends StatelessWidget {
  const CloseRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPdfForm(
      title: "استمارة وقف القيد",
      fields: [
        {"key": "name", "label": "الاسم"},
        {"key": "nationality", "label": "الجنسية"},
        {"key": "universityNumber", "label": "الرقم الجامعي"},
        {"key": "college", "label": "الكلية"},
        {"key": "department", "label": "القسم"},
        {"key": "level", "label": "المستوى"},
        {"key": "academicStatus", "label": "الحالة الدراسية"},
        {
          "key": "suspensionDuration",
          "label": "مدة وقف القيد ابتداء من الفصل الدراسي"
        },
        {"key": "phone", "label": "وحتى نهاية الفصل الدراسي"},
        {"key": "phone", "label": "رقم الهاتف"},
        {"key": "date", "label": "التاريخ"},
        // {"key": "deanApproval", "label": "موافقة عميد الكلية"},
        // {"key": "signature", "label": "التوقيع"},
      ],
    );
  }
}
