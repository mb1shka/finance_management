import 'dart:math';

import 'package:finance_management/design_system/design_system.dart';
import 'package:flutter/material.dart';

class FinancialTip extends StatelessWidget {
  const FinancialTip({super.key});

  String get randomFinancialTip {
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

  @override
  Widget build(BuildContext context) => Text(randomFinancialTip, style: AppTextStyles.text14Regular);
}
