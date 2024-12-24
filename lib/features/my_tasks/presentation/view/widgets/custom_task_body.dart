
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/helpers/extensions.dart';

import '../../../../../core/routers/routing.dart';

class CustomTaskBody extends StatelessWidget {
  const CustomTaskBody({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case "Waiting":
        return Colors.red.shade50;
      case "Inprogress":
        return Color(0xffF0ECFF);
      case "Finished":
        return Colors.blue.shade50;
      default:
        return Colors.grey.shade50;
    }
  }
  Color getStatusTextColor(String status) {
    switch (status) {
      case "Waiting":
        return Colors.red.shade300;
      case "Inprogress":
        return Color(0xff5F33E1);
      case "Finished":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
  Color getPriorityColor(String priority) {
    switch (priority) {
      case "Low":
        return Colors.blue;
      case "Medium":
        return Color(0xff5F33E1);
      case "High":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushNamed(Routing.taskDetail);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0 , bottom: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/shop_img.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Grocery Shopping App",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Gap(8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: getStatusColor('Finished'),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        
                        child: Text(
                          "Waiting",
                          style: TextStyle(
                            fontSize: 12,
                            color: getStatusTextColor('Finished'),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  // Task Description
                  Text(
                    "This application is designed for s...",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Priority and Date Row
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.flag,
                            size: 16,
                            color: getPriorityColor('High'),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Medium",
                            style: TextStyle(
                              fontSize: 12,
                              color: getPriorityColor('High'),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "30/12/2022",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {
                // Add functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
