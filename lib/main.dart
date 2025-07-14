import 'package:finance_management/repositories/budget/budget_repository_impl.dart';
import 'package:finance_management/screens/home/view/home_screen.dart';
import 'package:finance_management/screens/home/view_model/home_listener.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/di.dart';
import 'database/hive_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveConfig.init();

  await configureDependencies();
  setupDependencies();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeListener(di.get<BudgetRepositoryImpl>()))],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const HomeScreen());
  }
}
