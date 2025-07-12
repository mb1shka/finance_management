import 'package:finance_management/screens/home/view/greeting_widget.dart';
import 'package:flutter/material.dart';
import 'package:finance_management/design_system/design_system.dart';

const double _kPadding = 36;
const double _kRoundedBorderHeight = 30;

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220,
      collapsedHeight: 150,
      pinned: true,
      backgroundColor: AppColors.caribbeanGreen,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double greetingOpacity =
              (constraints.maxHeight - 150) / (220 - 150); // 200 = expandedHeight, 100 = collapsedHeight
          return DecoratedBox(
            decoration: BoxDecoration(color: AppColors.caribbeanGreen),
            child: Stack(
              children: [
                Positioned(bottom: _kRoundedBorderHeight + _kPadding, child: Container(height: 30, width: 40, color: Colors.lightBlue)),
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
                  child: Opacity(opacity: greetingOpacity.clamp(0.0, 1.0), child: GreetingWidget()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
