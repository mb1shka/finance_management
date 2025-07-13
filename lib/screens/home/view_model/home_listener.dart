import 'package:finance_management/repositories/budget_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:finance_management/di/di.dart';

class HomeListener extends ChangeNotifier {
  final BudgetRepository budgetRepository = di();

}
