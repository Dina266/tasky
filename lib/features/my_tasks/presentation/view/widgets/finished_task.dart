
import 'package:flutter/material.dart';
import 'package:tasky/features/my_tasks/presentation/view/widgets/custom_task_body.dart';


class FinishedTask extends StatelessWidget {
  const FinishedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context , index){
        return CustomTaskBody();
      });
  }
}