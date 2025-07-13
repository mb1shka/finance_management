import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:finance_management/entities/entities.dart';
import 'package:finance_management/errors/errors.dart';

const _kBoxId = 'budgetBox';

/// На данный момент можно создать и редактировать только один план бюджета.
const _kBudgetPlanKey = 0;

@singleton
class BudgetBox {
  static const _tag = 'BudgetBox';
  late final Box<BudgetPlanEntity> _box;

  BudgetPlanEntity? get budgetPlan => _box.get(_kBudgetPlanKey);

  bool get hasActiveBudget => _box.containsKey(_kBudgetPlanKey);

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    try {
      _box = await Hive.openBox<BudgetPlanEntity>(_kBoxId);
    } on HiveError catch (e) {
      log('Hive initialization failed', name: _tag, error: e, stackTrace: e.stackTrace);
      throw BudgetStorageFailure.fromHiveError(e);
    } catch (e, st) {
      log('Unexpected initialization error', name: _tag, error: e, stackTrace: st);
      throw const BudgetStorageFailure('Initialization failed');
    }
  }

  /// Создает новый бюджетный план (перезаписывает существующий)
  Future<void> createBudgetPlan(BudgetPlanEntity plan) async {
    try {
      await _validateBudgetPlan(plan);
      await _box.put(_kBudgetPlanKey, plan);
      log('Budget plan saved', name: _tag);
    } on HiveError catch (e) {
      log('Failed to save budget plan', name: _tag, error: e, stackTrace: e.stackTrace);
      throw BudgetStorageFailure.fromHiveError(e);
    }
  }

  Future<bool> updateBudgetPlan({DateTimeRange? newPeriod, List<ExpenseCategoryEntity>? newCategories}) async {
    try {
      final currentPlan = _box.get(_kBudgetPlanKey);
      if (currentPlan == null) {
        log('No budget plan found to update', name: _tag);
        return false;
      }

      final updatedPlan = BudgetPlanEntity(
        period: newPeriod ?? currentPlan.period,
        expenseCategories: newCategories ?? currentPlan.expenseCategories,
      );

      await _validateBudgetPlan(updatedPlan);
      await _box.put(_kBudgetPlanKey, updatedPlan);
      log('Budget plan updated', name: _tag);
      return true;
    } on HiveError catch (e) {
      log('Budget plan update failed', name: _tag, error: e, stackTrace: e.stackTrace);
      throw BudgetStorageFailure.fromHiveError(e);
    }
  }

  Future<void> deleteBudgetPlan() async {
    try {
      await _box.delete(_kBudgetPlanKey);
      log('Budget plan deleted', name: _tag);
    } on HiveError catch (e) {
      log('Failed to delete budget plan', name: _tag, error: e, stackTrace: e.stackTrace);
      throw BudgetStorageFailure.fromHiveError(e);
    }
  }

  Future<void> _validateBudgetPlan(BudgetPlanEntity plan) async {
    if (plan.period.end.isBefore(plan.period.start)) {
      throw const BudgetValidationFailure('End date cannot be before start date');
    }
    if (plan.expenseCategories.isEmpty) {
      throw const BudgetValidationFailure('Budget must have at least one category');
    }
  }
}
