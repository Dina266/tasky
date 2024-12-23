import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/services/get_it.dart';
import 'package:tasky/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:tasky/tasky_app.dart';

import 'core/api/dio_consumer.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/helpers/bloc_observer.dart';
import 'features/auth/presentation/view_model/repo/user_repo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setup();
  await getIt<CacheHelper>().init();
  runApp(BlocProvider(
      create: (context) =>
          AuthCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      child: const TaskyApp(),
    ),);
}
