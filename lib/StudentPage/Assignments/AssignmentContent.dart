import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:html' as html;

class AssignmentContent extends StatefulWidget {
  @override
  _AssignmentContent createState() => _AssignmentContent();
}

class _AssignmentContent extends State<AssignmentContent> {
  html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  String? selectedFileName;

  // for mobile
  // void downloadPdf() {
  //   final String url = "https://example.com/task.pdf";
  //   final html.AnchorElement anchor = html.AnchorElement(href: url)
  //     ..setAttribute("download", "task.pdf")
  //     ..click();
  // }

  // for browser
  void downloadPdf() {
    final String url = "https://yourserver.com/path/to/task.pdf";
    html.AnchorElement anchorElement = html.AnchorElement(href: url)
      ..setAttribute("download", "task.pdf")
      ..click();
  }

  void pickFile() {
    uploadInput.accept = '.pdf';
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final file = uploadInput.files!.first;
      setState(() {
        selectedFileName = file.name;
      });
    });
  }

  Future<void> uploadFile() async {
    if (uploadInput.files == null || uploadInput.files!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("يرجى اختيار ملف أولاً!")),
      );
      return;
    }

    // هنا يمكنك إرسال الملف إلى السيرفر عبر API
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("تم رفع التكليف بنجاح!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text("التكليف")),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.picture_as_pdf, size: 50, color: Colors.red),
                      SizedBox(height: 10),
                      Text("تحميل ملف التكليف بصيغة PDF",
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: downloadPdf, child: Text("تحميل التكليف")),
                Divider(height: 40),
                Text("بعد الانتهاء من التكليف، قم برفعه هنا بصيغة PDF:"),
                SizedBox(height: 10),
                ElevatedButton(onPressed: pickFile, child: Text("اختيار ملف")),
                if (selectedFileName != null)
                  Text("تم اختيار: $selectedFileName"),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: uploadFile, child: Text("تسليم التكليف")),
              ],
            ),
          ),
        ));
  }
}
