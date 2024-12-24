import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/routers/routing.dart';
import 'package:tasky/features/auth/presentation/view/login.dart';
import 'package:tasky/features/auth/presentation/view/register.dart';
import 'package:tasky/features/edit_task/presentation/view/edit_task.dart';
import 'package:tasky/features/my_tasks/presentation/view/my_tasks_view.dart';
import 'package:tasky/features/my_tasks/presentation/view/widgets/task_detail_screen.dart';
import 'package:tasky/features/profile/presentation/view/profile_view.dart';

import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

class AppRouters {
  Route generateRoute(RouteSettings settings) {
    // var argument = settings.arguments;
    switch (settings.name) {
      case Routing.init:
        return _buildRoute(SplashView());

      case Routing.onboarding:
        return _buildRoute(OnboardingView());
      
      case Routing.login:
        return _buildRoute(Login());
      case Routing.register:
        return _buildRoute(Register());
      case Routing.myTasks:
        return _buildRoute(MyTasksView());
      case Routing.taskDetail:
        return _buildRoute(TaskDetailsScreen());
      case Routing.profile:
        return _buildRoute(ProfileView());
      case Routing.editTask:
        return _buildRoute(EditTask());
      
      default:
        return _buildRoute(
          Scaffold(
            body: Center(child: Text('Page not found: ${settings.name}')),
          ),
        );
    }
  }

  Route<dynamic> _buildRoute(Widget page) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: (_) => page,
          )
        : MaterialPageRoute(builder: (_) => page);
  }
}