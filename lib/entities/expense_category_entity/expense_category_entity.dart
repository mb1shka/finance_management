import 'package:finance_management/entities/hive_object_ids.dart';
import 'package:hive/hive.dart';

part 'expense_category_entity.g.dart';

@HiveType(typeId: HiveObjectId.kExpenseCategoryEntityId)
class ExpenseCategoryEntity {
  ExpenseCategoryEntity({required this.budget, required this.iconPath, required this.alreadySpentMoney});

  @HiveField(0)
  double budget;

  @HiveField(1)
  String iconPath;

  @HiveField(2)
  double alreadySpentMoney;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseCategoryEntity &&
          runtimeType == other.runtimeType &&
          budget == other.budget &&
          iconPath == other.iconPath &&
          alreadySpentMoney == other.alreadySpentMoney;

  @override
  int get hashCode => budget.hashCode ^ iconPath.hashCode ^ alreadySpentMoney.hashCode;

  @override
  String toString() {
    return 'ExpenseCategoryEntity{budget: $budget, iconPath: $iconPath, alreadySpentMoney: $alreadySpentMoney}';
  }
}
