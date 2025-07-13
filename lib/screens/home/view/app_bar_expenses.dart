import 'package:finance_management/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//TODO: После создания бд данные по бюджету и остатку тянем через вм из бокса hive
class AppBarExpenses extends StatefulWidget {
  const AppBarExpenses({super.key});

  @override
  State<StatefulWidget> createState() => _AppBarExpensesState();
}

class _AppBarExpensesState extends State<AppBarExpenses> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _RemainingBudget(money: 200, daysRemaining: 105),
            SizedBox(height: 42, child: const VerticalDivider(color: AppColors.honeyDrew)),
            _AlreadySpent(money: 800),
          ],
        ),
        const SizedBox(height: 12),
        _ExpenseProgressIndicator(percentsRemaining: 70),
      ],
    );
  }
}

class _RemainingBudget extends StatelessWidget {
  const _RemainingBudget({required this.money, required this.daysRemaining});

  final double money;
  final int daysRemaining;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.income),
            const SizedBox(width: 8),
            Text('Осталось на $daysRemaining $daysRemainingString', style: AppTextStyles.text12Regular),
          ],
        ),
        Text('${money.toStringAsFixed(2)}₽', style: AppTextStyles.text24BoldWhite),
      ],
    );
  }

  String get daysRemainingString {
    switch (daysRemaining) {
      case _ when daysRemaining % 10 == 1:
        return 'день';
      case _ when [2, 3, 4].contains(daysRemaining % 10):
        return 'дня';
      default:
        return 'дней';
    }
  }
}

class _AlreadySpent extends StatelessWidget {
  const _AlreadySpent({required this.money});

  final double money;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.expense),
            const SizedBox(width: 8),
            Text('Потрачено', style: AppTextStyles.text12Regular),
          ],
        ),
        Text('-${money.toStringAsFixed(2)}₽', style: AppTextStyles.text24BoldOceanBlue),
      ],
    );
  }
}

class _ExpenseProgressIndicator extends StatelessWidget {
  final double percentsRemaining;

  const _ExpenseProgressIndicator({required this.percentsRemaining})
    : assert(percentsRemaining >= 0 && percentsRemaining <= 100);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadiuses.l),
        child: Stack(
          children: [
            Container(color: AppColors.fenceGreen),
            Align(
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: percentsRemaining / 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.honeyDrew,
                    borderRadius: BorderRadius.all(Radius.circular(AppRadiuses.l)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
