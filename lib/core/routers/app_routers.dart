import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppRouters {
  Route generateRoute(RouteSettings settings) {
    // var argument = settings.arguments;
    switch (settings.name) {
      // case Routing.splash:
      //   return _buildRoute(SplashView());

      // case Routing.onboarding:
      //   return _buildRoute(OnboardingView());
      
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