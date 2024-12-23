import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/extensions.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/database/cache/cache_keys.dart';
import '../../../../core/routers/routing.dart';
import '../../../../core/services/get_it.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => _getInitRoute(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/splash_img.png',
          fit: BoxFit.cover, 
        ),
      ),
    );
  }

  void _getInitRoute() {
    final isFirstTime = getIt<CacheHelper>().getData(key: CacheKeys.isFirstTime) ?? true;
    if (isFirstTime) {
      context.pushReplacementNamed(Routing.onboarding);
    } else {
      context.pushReplacementNamed(Routing.onboarding);
    }
  }
}
