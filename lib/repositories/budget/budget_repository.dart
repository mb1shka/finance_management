import 'package:finance_management/entities/entities.dart';
import 'package:flutter/material.dart';

abstract class BudgetRepository {

  bool get hasActiveBudget;

  BudgetPlanEntity? get budgetPlan;

  Future<void> createBudgetPlan(BudgetPlanEntity plan);

  Future<bool> updateBudgetPlan({DateTimeRange? newPeriod, List<ExpenseCategoryEntity>? newCategories});

  Future<void> deleteBudgetPlan();
}
