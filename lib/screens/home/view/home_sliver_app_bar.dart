import 'package:flutter/material.dart';
import 'package:finance_management/design_system/design_system.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220, // Увеличил высоту для текста
      collapsedHeight: kToolbarHeight,
      pinned: true,
      backgroundColor: AppColors.caribbeanGreen,
      flexibleSpace: Stack(
        children: [
          // Вогнутая маска
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
            ),
          ),

          // Контент AppBar с поднятым текстом
          const Align(
            alignment: Alignment(0, 0.3), // Поднимаем текст выше
            child: Text(
              'Скролл меня',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.black26,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
