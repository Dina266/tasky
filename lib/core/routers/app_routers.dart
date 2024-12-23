import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/routers/routing.dart';
import 'package:tasky/features/auth/presentation/view/login.dart';
import 'package:tasky/features/auth/presentation/view/register.dart';

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