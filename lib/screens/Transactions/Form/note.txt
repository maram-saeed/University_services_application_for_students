import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'dart:html' as html;

class CustomPdfForm extends StatefulWidget {
  final String title; // عنوان النموذج (مثلاً: "استمارة إعادة القيد")
  final List<Map<String, String>> fields; // قائمة الحقول الديناميكية

  CustomPdfForm({required this.title, required this.fields});

  @override
  _CustomPdfFormState createState() => _CustomPdfFormState();
}

class _CustomPdfFormState extends State<CustomPdfForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  @override
  void initState() {
    super.initState();
    for (var field in widget.fields) {
      formData[field['key']!] = "";
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  Future<void> _generatePdf() async {
    final pdf = pw.Document();

    final Uint8List fontData = await rootBundle
        .load("assets/fonts/Cairo-Regular.ttf")
        .then((data) => data.buffer.asUint8List());
    final ttf = pw.Font.ttf(fontData.buffer.asByteData());

    pdf.addPage(
      pw.Page(
        theme: pw.ThemeData.withFont(base: ttf),
        build: (pw.Context context) => pw.Directionality(
          textDirection: pw.TextDirection.rtl,
          child: pw.Column(
            children: [
              pw.Text("جامعة الجزيرة",
                  style: pw.TextStyle(fontSize: 17, color: PdfColors.green500)),
              pw.SizedBox(height: 10),
              pw.Text(widget.title,
                  style: pw.TextStyle(fontSize: 20, color: PdfColors.black)),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(),
                children: widget.fields.map((field) {
                  return _buildTableRow(
                      field['label']!, formData[field['key']!]!, ttf);
                }).toList(),
              ),
              pw.SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );

    Uint8List bytes = await pdf.save();

    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'custom_form.pdf')
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  pw.TableRow _buildTableRow(String title, String value, pw.Font ttf) {
    String truncatedValue =
        value.length > 30 ? value.substring(0, 30) + "..." : value;
    return pw.TableRow(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Text(truncatedValue,
              style: pw.TextStyle(fontSize: 12, font: ttf)),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Text(title,
              style: pw.TextStyle(
                  fontSize: 12, fontWeight: pw.FontWeight.bold, font: ttf)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          TextDirection.rtl, // يضمن أن كل النصوص من اليمين إلى اليسار
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                ...widget.fields.map((field) {
                  return TextFormField(
                    textDirection: TextDirection.rtl, // يجعل الإدخال من اليمين
                    textAlign: TextAlign.right, // يضبط النص إلى اليمين
                    decoration: InputDecoration(
                      labelText: field['label'],
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    onSaved: (value) => formData[field['key']!] = value!,
                  );
                }).toList(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
                    _generatePdf();
                  },
                  child: Text("تحميل PDF"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
