import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeExpenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeExpensesState();
}

class _HomeExpensesState extends State<HomeExpenses> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          title: Text(
            index == 0
                ? 'Salary'
                : index == 1
                ? 'Groceries'
                : 'Rent',
          ),
          subtitle: Text(
            index == 0
                ? '18:27 - April 30 | Monthly | \$4,000.00'
                : index == 1
                ? '17:00 - April 24 | Pantry | -\$100.00'
                : '8:30 - April 15 | Rent | -\$674.40',
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
        ),
        childCount: 3, // 3 транзакции как на скриншоте
      ),
    );
  }
}
