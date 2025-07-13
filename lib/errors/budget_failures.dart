import 'package:hive/hive.dart';

abstract class BudgetFailure implements Exception {
  final String message;
  const BudgetFailure(this.message);
}

class BudgetValidationFailure extends BudgetFailure {
  const BudgetValidationFailure(super.message);
}

class BudgetStorageFailure extends BudgetFailure {
  const BudgetStorageFailure(super.message);

  factory BudgetStorageFailure.fromHiveError(HiveError error) {
    return BudgetStorageFailure('Storage error: ${error.message}');
  }
}
