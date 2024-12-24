
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/helpers/extensions.dart';
import 'task_qr_generator.dart';
import 'task_sections.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Task Details",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: (){
            context.pop();
          }, 
          icon: SvgPicture.asset('assets/images/arrow_back.svg')),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Edit"),
                onTap: () {},
              ),
              PopupMenuItem(
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo and Title
              Center(
                child: Image.asset(
                  'assets/images/image.png',
                  fit: BoxFit.fill,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 16),
              // Task Title and Description
              const Text(
                "Grocery Shopping App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              TaskSections(),
              const SizedBox(height: 24),
              TaskQRGenerator()
            ],
          ),
        ),
      ),
    );
  }
}



