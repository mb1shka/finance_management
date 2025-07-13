import 'package:finance_management/entities/entities.dart';
import 'package:finance_management/entities/hive_object_ids.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'budget_plan_entity.g.dart';

@HiveType(typeId: HiveObjectId.kBudgetPlanEntityId)
class BudgetPlanEntity {
  BudgetPlanEntity({required this.period, required this.expenseCategories});

  @HiveField(0)
  final DateTimeRange period;

  @HiveField(1)
  List<ExpenseCategoryEntity> expenseCategories;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BudgetPlanEntity &&
              runtimeType == other.runtimeType &&
              period == other.period &&
              expenseCategories == other.expenseCategories;

  @override
  int get hashCode => period.hashCode ^ expenseCategories.hashCode;

  @override
  String toString() {
    return 'BudgetPlanEntity{period: $period, expenseCategories: $expenseCategories}';
  }
}

