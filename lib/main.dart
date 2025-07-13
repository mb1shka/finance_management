import 'package:finance_management/screens/home/view/home_screen.dart';
import 'package:flutter/material.dart';

import 'di/di.dart';
import 'database/hive_config.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await HiveConfig.init();

  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
