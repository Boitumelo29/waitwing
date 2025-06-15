
import 'package:flutter/material.dart';
import 'package:waitwing/core/app/app.dart';
import 'package:waitwing/core/init/app_initializer.dart';

Future<void> bootstrap()async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initialize();
  runApp(App());
}