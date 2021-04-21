import 'package:flutter/material.dart';

enum cellMode {
  EMPTY,
  YELLOW,
  RED,
}

class Cell extends StatelessWidget {
  final currentCellMode;


  Cell({Key key, @required this.currentCellMode})
      : super(key: key);


  Color setColor() {
    switch (this.currentCellMode) {
      case cellMode.YELLOW:
        return Colors.yellow;
      case cellMode.RED:
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  Container buildCoin() {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32), color: setColor()),
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
