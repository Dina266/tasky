import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TaskQRGenerator extends StatelessWidget {
  

  const TaskQRGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> task = {
    "image": "https://th.bing.com/th/id/R.2211a28e0a154c4b34ff8acfb945dba1?rik=R0jaR4Nk7pwPKw&pid=ImgRaw&r=0",
    "title": "title",
    "desc": "desc",
    "priority": "low",
    "dueDate": "2024-05-15"
  };
    // Convert the task data to a JSON string
    String taskJson = jsonEncode(task);

    return Center(
        child: QrImageView(
          data: taskJson, // JSON data for the QR code
          version: QrVersions.auto,
          size: 200.0, // Size of the QR code
          gapless: false,
        ),
    );
  }
}