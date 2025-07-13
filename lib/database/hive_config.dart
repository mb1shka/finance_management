import 'package:hive_flutter/hive_flutter.dart';
import 'package:finance_management/entities/entities.dart';

abstract class HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
  }

  static void _registerAdapters() {
    Hive.registerAdapter(ExpenseCategoryEntityAdapter());
    Hive.registerAdapter(BudgetPlanEntityAdapter());
  }

}
