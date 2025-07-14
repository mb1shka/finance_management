import 'package:finance_management/database/boxes.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:finance_management/entities/entities.dart';

import 'budget_repository.dart';

@singleton
@Injectable(as: BudgetRepository)
class BudgetRepositoryImpl implements BudgetRepository {
  BudgetRepositoryImpl(this._budgetBox);

  final BudgetBox _budgetBox;

  @override
  bool get hasActiveBudget => _budgetBox.hasActiveBudget;

  @override
  BudgetPlanEntity? get budgetPlan => _budgetBox.budgetPlan;

  @override
  Future<void> createBudgetPlan(BudgetPlanEntity plan) async => await _budgetBox.createBudgetPlan(plan);

  @override
  Future<bool> updateBudgetPlan({DateTimeRange? newPeriod, List<ExpenseCategoryEntity>? newCategories}) async =>
      await _budgetBox.updateBudgetPlan(newPeriod: newPeriod, newCategories: newCategories);

  @override
  Future<void> deleteBudgetPlan() async => await _budgetBox.deleteBudgetPlan();
}
