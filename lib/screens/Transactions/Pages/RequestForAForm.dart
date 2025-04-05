import 'package:flutter/material.dart';
import '../Form/TransactionForm.dart';

/**
 * عميد شؤون الطلبة
 * مدير المعامل
 * افادة الكنترول
 * افادة شؤون الخريجين
 * حسابات الطلبة
 * الأمين العام
 * شؤون الخريجين
 */

class RequestForAFormPage extends StatelessWidget {
  const RequestForAFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPdfForm(
      title: "استمارة سحب وثائق واخلاء طرف خريجين",
      fields: [
        {"key": "name", "label": "الاسم"},
        {"key": "college", "label": "الكلية"},
        {"key": "major", "label": "التخصص"},
        {"key": "academicNumber", "label": "الرقم الأكاديمي"},
        {
          "key": "restrictedToStudyInAdepartment",
          "label": "مقيد للدراسة في قسم"
        },
        {"key": "universityGraduate", "label": "خريج العام الجامعي"},
        {
          "key": "nameOfTheSpecialist",
          "label": "عهدة المكتبة (لايوجد) اسم المختص"
        },
        {"key": "nameOfTheSpecialist2", "label": "الحاسوب (لايوجد) اسم المختص"},
        // {"key": "section", "label": "المعامل (خاص بالعلوم الطبية)"},
        {"key": "section", "label": "القسم"},
        {"key": "level", "label": "المستوى"},
      ],
      employees: [
        "المسجل العام",
        "الحسابات",
        "الأمين العام",
        "عميد شؤون الطلبة",
        "رئيس القسم",
        "عميدالكلية"
      ],
    );
  }
}
