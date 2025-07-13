import 'package:flutter/material.dart';
import 'package:finance_management/design_system/design_system.dart';

import 'app_bar_expenses.dart';

const double _kPadding = 36;
const double _kRoundedBorderHeight = 30;
const double _kCollapsedHeight = 160;
const double _kExpandedHeight = 240;

class HomeSliverAppBar extends StatefulWidget {
  const HomeSliverAppBar({super.key});

  @override
  State<StatefulWidget> createState() => _HomeSliverAppBarState();
}

class _HomeSliverAppBarState extends State<HomeSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _kExpandedHeight,
      collapsedHeight: _kCollapsedHeight,
      pinned: true,
      backgroundColor: AppColors.caribbeanGreen,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double greetingWidgetOpacity =
              (constraints.maxHeight - _kCollapsedHeight - 50) / (_kExpandedHeight - _kCollapsedHeight - 50);
          return DecoratedBox(
            decoration: BoxDecoration(color: AppColors.caribbeanGreen),
            child: Stack(
              children: [
                Positioned(
                  bottom: _kRoundedBorderHeight + _kPadding,
                  right: _kPadding,
                  left: _kPadding,
                  child: AppBarExpenses(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: _kRoundedBorderHeight,
                    decoration: BoxDecoration(
                      color: AppColors.honeyDrew,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadiuses.xxxl)),
                    ),
                  ),
                ),
                Positioned(
                  top: _kPadding,
                  left: _kPadding,
                  child: Opacity(opacity: greetingWidgetOpacity.clamp(0.0, 1.0), child: _GreetingWidget()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _GreetingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(minutes: 5)),
      builder: (context, _) {
        return Text(greetingText, style: AppTextStyles.text20Regular);
      },
    );
  }

  String get greetingText {
    final hour = DateTime.now().hour;
    switch (hour) {
      case _ when hour >= 5 && hour < 12:
        return 'Доброе утро!';
      case _ when hour >= 12 && hour < 17:
        return 'Добрый день!';
      case _ when hour >= 17 && hour < 23:
        return 'Добрый вечер!';
      default:
        return 'Доброй ночи!';
    }
  }
}
