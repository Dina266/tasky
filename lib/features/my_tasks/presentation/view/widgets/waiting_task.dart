import 'package:flutter/material.dart';

import 'custom_task_body.dart';


class WaitingTask extends StatelessWidget {
  const WaitingTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context , index){
        return CustomTaskBody();
      });
  }
}