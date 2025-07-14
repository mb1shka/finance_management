import 'package:finance_management/entities/entities.dart';
import 'package:finance_management/repositories/budget/budget_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeListener extends ChangeNotifier {
  HomeListener(BudgetRepository budgetRepository)
    : _budgetRepository = budgetRepository,
      _hasActiveBudget = budgetRepository.hasActiveBudget,
      _budgetPlan = budgetRepository.budgetPlan;

  final BudgetRepository _budgetRepository;
  bool _hasActiveBudget;
  BudgetPlanEntity? _budgetPlan;

  bool get hasActiveBudget => _hasActiveBudget;
  BudgetPlanEntity? get budgetPlan => _budgetPlan;

  Future<void> refreshBudgetStatus() async {
    final newStatus = _budgetRepository.hasActiveBudget;
    final newPlan = _budgetRepository.budgetPlan;

    if (newStatus != _hasActiveBudget || newPlan != _budgetPlan) {
      _hasActiveBudget = newStatus;
      _budgetPlan = newPlan;
      notifyListeners();
    }
  }

  void createBudgetPlan() {
    //TODO: реализовать
  }
}
