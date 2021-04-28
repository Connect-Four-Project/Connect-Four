import 'package:flutter/material.dart';

enum CellMode {
  EMPTY,
  PLAYER_1,
  PLAYER_2,
}

class Cell extends StatelessWidget {
  final CellMode currentCellMode;

  Cell({Key key, @required this.currentCellMode}) : super(key: key);

  Color _setColor() {
    switch (this.currentCellMode) {
      case CellMode.PLAYER_1:
        return Colors.yellow;
      case CellMode.PLAYER_2:
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
          color: Colors.blue[800],
          child: Container(
            margin: EdgeInsets.only(top: 5),
            height: 35,
            width: 35,
            // duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _setColor(),
            ),
          ),
        ),
      ],
    );
  }
}
