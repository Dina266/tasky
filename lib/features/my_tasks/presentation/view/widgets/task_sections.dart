

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TaskSections extends StatefulWidget {
  const TaskSections({super.key});

  @override
  TaskSectionsState createState() => TaskSectionsState();
}

class TaskSectionsState extends State<TaskSections> {
  String? selectedDate;
  String status = "Inprogress";
  String priority = "Medium";

  final List<String> statusOptions = ["Inprogress", "Waiting", "Finished"];
  final List<String> priorityOptions = ["Low", "Medium", "High"];
Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null ) {
      setState(() {
        selectedDate = DateFormat('dd MMMM yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 24, top: 4 , bottom: 4),
              decoration: BoxDecoration(
                color: Color(0xffF0ECFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "End Date",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        selectedDate == null ? DateFormat('dd MMMM yyyy').format(DateTime.now())
                        :selectedDate!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: SvgPicture.asset("assets/images/calendar.svg"),
                    onPressed: () => pickDate(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(left: 24, right: 13 , top: 4 , bottom: 4),
              decoration: BoxDecoration(
                color: Color(0xffF0ECFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: status,
                  isExpanded: true,
                  icon: SvgPicture.asset('assets/images/arrow_down.svg'),
                  items: statusOptions
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(color: Color(0xff5F33E1)),),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      status = newValue!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(left: 24, right: 13 , top: 4 , bottom: 4),
              decoration: BoxDecoration(
                color: Color(0xffF0ECFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: priority,
                  isExpanded: true,
                  icon: SvgPicture.asset('assets/images/arrow_down.svg'),
                  items: priorityOptions
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.flag_outlined,
                                  color: Color(0xff5F33E1),
                                ),
                                const SizedBox(width: 8),
                                Text('$value Priority', style: TextStyle(color: Color(0xff5F33E1)),),
                              ],
                            ),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      priority = newValue!;
                    });
                  },
                ),
              ),
            ),
          ]
    );
  }
  
}
