import 'package:hive_flutter/hive_flutter.dart';
import 'package:finance_management/database/hive_config.dart';

/// Holds the ids of hive objects in this project.
///
/// Don't forget to register the generated [TypeAdapter]s in [HiveConfig]
///
/// Consider creating [TypeAdapter] manually, if codegen takes up too much time.
abstract class HiveObjectId {
  /// Max possible ID at the time of writing this.
  static const _kMaxId = 20;

  static const kExpenseCategoryEntityId = 0;
  static const kBudgetPlanEntityId = 1;
}
