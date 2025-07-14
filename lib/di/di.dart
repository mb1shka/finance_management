import 'package:finance_management/database/boxes.dart';
import 'package:finance_management/repositories/budget/budget_repository.dart';
import 'package:finance_management/repositories/budget/budget_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final di = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() => $initGetIt(di);

void setupDependencies() {
  di.registerSingleton<BudgetRepository>(BudgetRepositoryImpl(di.get<BudgetBox>()));
}
