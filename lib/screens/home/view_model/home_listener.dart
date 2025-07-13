import 'package:finance_management/repositories/budget_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:finance_management/di/di.dart';

class HomeListener extends ChangeNotifier {
  final BudgetRepository budgetRepository = di();

  // try {
  // await budgetRepository.createBudgetPlan(myPlan);
  // } on BudgetValidationException catch (e) {
  // showError('Некорректные данные: ${e.message}');
  // } on BudgetStorageException catch (e) {
  // showError('Ошибка сохранения: ${e.message}');
  // }
}
