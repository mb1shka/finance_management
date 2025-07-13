import 'package:flutter/material.dart';

///Используется для накидывания простой верстки сгенерированной ИИ
class Debug extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            bottom: PreferredSize(
              child: Container(),
              preferredSize: Size(0, 20),
            ),
            pinned: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent[100],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                ),
              ],
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index + 1 % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
