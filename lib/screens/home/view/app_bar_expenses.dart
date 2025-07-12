import 'dart:math';

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
            Text(
              'Осталось на $daysRemaining $daysRemainingString',
              style: AppTextStyles.text12Regular,
            ),
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
      case _ when [2,3,4].contains(daysRemaining % 10):
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
            Text(
              'Потрачено',
              style: AppTextStyles.text12Regular,
            ),
          ],
        ),
        Text('-${money.toStringAsFixed(2)}₽', style: AppTextStyles.text24BoldOceanBlue),
      ],
    );
  }
}

class _ExpenseProgressIndicator extends StatelessWidget {
  const _ExpenseProgressIndicator({required this.budget, required this.spentPercentage});

  final double budget;
  final double spentPercentage;

  @override
  Widget build(BuildContext context) {
    return Text('ff', style: AppTextStyles.text24semiBold);
  }
}

class _FinancialTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(_getRandomFinancialTip(), style: AppTextStyles.text14Regular);
  }

  String _getRandomFinancialTip() {
    final tips = [
      "Записывайте все траты — так проще найти, на чем сэкономить",
      "Перед покупкой задайте вопрос: 'Мне это действительно нужно?'",
      "Откладывайте 10% от любой суммы, которая к вам поступает",
      "Список покупок перед походом в магазин сбережет вам деньги",
      "Крупные покупки лучше планировать заранее, а не покупать импульсивно",
      "Акции — не экономия, если вы покупаете лишнее",
      "Разделите счет на 'нужно' и 'хочется' перед оплатой",
      "Раз в месяц проверяйте подписки — возможно, какие-то пора отменить",
      "Храните сбережения на отдельном счете без карты",
      "Мелкие ежедневные траты складываются в крупные суммы за год",
    ];

    final random = Random();
    return tips[random.nextInt(tips.length)];
  }
}
