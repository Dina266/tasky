import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';  // Import the intl package for date formatting
import 'package:tasky/core/widgets/custom_button.dart';
import 'package:tasky/core/widgets/custom_edit_field.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  String priority = "Medium";
  final List<String> priorityOptions = ["Low", "Medium", "High"];
  TextEditingController dueDateController = TextEditingController();  // Controller for due date

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null ) {
      setState(() {
        dueDateController.text = DateFormat('dd MMMM yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          "Add new task",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/images/arrow_back.svg')),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  color: Color(0xff5F33E1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/add_photo.svg'),
                          Gap(8),
                          Text('Add Img', style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5F33E1)
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(16.h),
                Text('Task title',style:TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color :Color(0xff6E6A7C)
                ),),
                Gap(16.h),
                CustomEditTextFormField(
                  controller: TextEditingController(),
                  hintTxt: 'Enter title here...',
                ),
                Gap(16.h),
                Text('Task Description',style:TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color :Color(0xff6E6A7C)
                ),),
                Gap(16.h),
                CustomEditTextFormField(
                  controller: TextEditingController(),
                  hintTxt: 'Enter description here...',
                  maxLines: 7,
                ),
                Gap(16.h),
                Text('Priority',style:TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color :Color(0xff6E6A7C)
                ),),
                Gap(16.h),
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
                                Text('$value Priority', style: TextStyle(color: Color(0xff5F33E1))),
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
                Gap(16.h),
                Text('Due date',style:TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color :Color(0xff6E6A7C)
                ),),
                Gap(16.h),
                CustomEditTextFormField(
                  controller: dueDateController,  // Use the dueDateController here
                  hintTxt: 'Enter due date...',
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset("assets/images/calendar.svg"),
                    onPressed: () => pickDate(context),
                  ),
                ),
                Gap(28.5.h),
            
                CustomButton(txt: Text('Add Task',style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),), 
                onPressed: (){
                  //todo
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
