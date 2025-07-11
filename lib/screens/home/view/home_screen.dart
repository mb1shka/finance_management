import 'package:finance_management/screens/home/view/home_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:finance_management/design_system/design_system.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.caribbeanGreen,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeSliverAppBar(),
            //TODO: Плашка с бюджетом. Отображаем бюджет на заданный период (прим: месяц)
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      height: 200, // Уменьшил высоту для демонстрации
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total Balance', style: TextStyle(color: Colors.white)),
                          Text('\$7,783.00', style: TextStyle(fontSize: 32, color: Colors.white)),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Recent Transactions', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final itemCount = 10;
                        final rows = (itemCount / 2).ceil();
                        final totalHeight = rows * 120 + (rows - 1) * 10;

                        return SizedBox(
                          height: totalHeight.toDouble(),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 1.2,
                            ),
                            itemCount: itemCount,
                            itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(child: Text('Item ${index + 1}')),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
