import 'package:finance_management/database/boxes.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:finance_management/entities/entities.dart';

@injectable
class BudgetRepository {
  BudgetRepository(this._budgetBox);

  final BudgetBox _budgetBox;

  Future<void> createBudgetPlan(BudgetPlanEntity plan) async => await _budgetBox.createBudgetPlan(plan);

  Future<bool> updateBudgetPlan({DateTimeRange? newPeriod, List<ExpenseCategoryEntity>? newCategories}) async =>
      await _budgetBox.updateBudgetPlan(newPeriod: newPeriod, newCategories: newCategories);

  Future<void> deleteBudgetPlan() async => await _budgetBox.deleteBudgetPlan();
}
