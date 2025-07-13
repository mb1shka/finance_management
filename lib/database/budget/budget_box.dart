import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:finance_management/entities/entities.dart';

const _kBoxId = 'budgetBox';

/// На данный момент можно создать и редактировать только один план бюджета.
const _kBudgetPlanKey = 0;

@singleton
class BudgetBox {
  late final Box<BudgetPlanEntity> _box;

  //Box<BudgetPlanEntity> get box => _box;

  BudgetPlanEntity? get budgetPlan => _box.get(_kBudgetPlanKey);

  bool get hasActiveBudget => _box.containsKey(_kBudgetPlanKey);

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    var box = await Hive.openBox<BudgetPlanEntity>(_kBoxId);
    _box = box;
  }

  /// Создает новый бюджетный план (перезаписывает существующий)
  Future<void> createBudgetPlan(BudgetPlanEntity plan) async => await _box.put(_kBudgetPlanKey, plan);

  Future<bool> updateBudgetPlan({DateTimeRange? newPeriod, List<ExpenseCategoryEntity>? newCategories}) async {
    final currentPlan = _box.get(_kBudgetPlanKey);
    if (currentPlan == null) return false;

    final updatedPlan = BudgetPlanEntity(
      period: newPeriod ?? currentPlan.period,
      expenseCategories: newCategories ?? currentPlan.expenseCategories,
    );

    await _box.put(_kBudgetPlanKey, updatedPlan);
    return true;
  }

  Future<void> deleteBudgetPlan() async => await _box.delete(_kBudgetPlanKey);
}
