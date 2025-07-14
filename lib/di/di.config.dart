// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../database/boxes.dart' as _i781;
import '../database/budget/budget_box.dart' as _i532;
import '../repositories/budget/budget_repository_impl.dart' as _i259;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  await gh.singletonAsync<_i532.BudgetBox>(
    () {
      final i = _i532.BudgetBox();
      return i.init().then((_) => i);
    },
    preResolve: true,
  );
  gh.singleton<_i259.BudgetRepositoryImpl>(
      () => _i259.BudgetRepositoryImpl(gh<_i781.BudgetBox>()));
  return getIt;
}
