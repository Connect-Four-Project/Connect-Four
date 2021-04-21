import 'package:flutter/material.dart';

import 'coin.dart';

enum cellMode {
  EMPTY,
  YELLOW,
  RED,
}

class Cell extends StatelessWidget {
  final currentCellMode;

  Cell({Key key, @required this.currentCellMode}) : super(key: key);

  Color currColor = Colors.red;

  void initColor() {
    switch (this.currentCellMode) {
      case cellMode.YELLOW:
        currColor = Colors.yellow;
        break;
      case cellMode.RED:
        currColor = Colors.red;
        break;
      default:
        currColor = Colors.white;
    }
  }

  Container buildCoin() {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32), color: currColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          color: Colors.blue,
        ),
        Positioned.fill(
            child: Align(alignment: Alignment.center, child: buildCoin()))
      ],
    );
  }
}
