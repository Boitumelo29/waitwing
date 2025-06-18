import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitwing/core/app/app.dart';
import 'package:waitwing/core/bloc_observer/app_bloc_observor.dart';
import 'package:waitwing/core/dependency_injection/di.dart';
import 'package:waitwing/core/init/app_initializer.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initialize();
  setupDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(App());
}