import 'package:flutter/material.dart';
import 'package:finance_management/design_system/design_system.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(minutes: 5)),
      builder: (context, _) {
        return Text(_getGreeting(), style: AppTextStyles.text24semiBoldWhite);
      },
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Доброе утро!';
    } else if (hour >= 12 && hour < 17) {
      return 'Добрый день!';
    } else if (hour >= 17 && hour < 23) {
      return 'Добрый вечер!';
    } else {
      return 'Доброй ночи!';
    }
  }
}
