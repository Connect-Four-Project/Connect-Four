import 'package:flutter/material.dart';

enum CellMode {
  EMPTY,
  YELLOW,
  RED,
}

class Cell extends StatelessWidget {
  final CellMode currentCellMode;

  Cell({Key key, @required this.currentCellMode}) : super(key: key);

  Color setColor() {
    switch (this.currentCellMode) {
      case CellMode.YELLOW:
        return Colors.yellow;
      case CellMode.RED:
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          color: Colors.blue,
          child: Icon(
            Icons.circle,
            color: setColor(),
            size: 50,
          ),
        ),
      ],
    );
  }
}
