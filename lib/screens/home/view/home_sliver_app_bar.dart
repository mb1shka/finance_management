import 'package:finance_management/screens/home/view/greeting_widget.dart';
import 'package:flutter/material.dart';
import 'package:finance_management/design_system/design_system.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220,
      collapsedHeight: 100,
      pinned: true,
      backgroundColor: AppColors.caribbeanGreen,
      elevation: 0,
      flexibleSpace: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.caribbeanGreen,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.honeyDrew,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadiuses.xxxl)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 36, 36, 0),
              child: Column(
                children: [
                  GreetingWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

