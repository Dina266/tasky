import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routers/app_routers.dart';
import 'core/routers/routing.dart';

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: MediaQuery.of(context).size,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routing.init,
            // themeMode: ThemeMode.light,
            onGenerateRoute: AppRouters().generateRoute,
          );
        });
  }
}