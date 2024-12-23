import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/services/get_it.dart';
import 'package:tasky/tasky_app.dart';

import 'core/database/cache/cache_helper.dart';
import 'core/helpers/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setup();
  await getIt<CacheHelper>().init();
  runApp(const TaskyApp());
}
