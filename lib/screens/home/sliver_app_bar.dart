import 'package:flutter/material.dart';
import 'package:finance_management/design_system/design_system.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120,
      collapsedHeight: 60, // Остается видимым при скролле
      pinned: true,
      backgroundColor: AppColors.caribbeanGreen,
      flexibleSpace: const FlexibleSpaceBar(
        //TODO: добавить текстовые стили
        title: Text('Good Morning', style: TextStyle(color: AppColors.honeyDrew)),
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 20, bottom: 15),
      ),
    );
  }

}
