import 'package:flutter/material.dart';

import 'custom_task_body.dart';
class AllTask extends StatelessWidget {
  const AllTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context , index){
        return CustomTaskBody();
      });
  }
}

