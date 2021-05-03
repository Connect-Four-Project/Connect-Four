import 'package:connect_four/game_controller/controller.dart';
import 'package:flutter/material.dart';

enum CellMode {
  EMPTY,
  PLAYER_1,
  PLAYER_2,
}

class Cell extends StatelessWidget {
  final CellMode currentCellMode;
  final int row, col;
  final bool isGameOver;

  Cell(
      {Key key,
      @required this.currentCellMode,
      @required this.row,
      @required this.col,
      @required this.isGameOver})
      : super(key: key);

  Color _setColor() {
    Color cellColor;
    switch (this.currentCellMode) {
      case CellMode.PLAYER_1:
        cellColor = Colors.yellow;
        break;
      case CellMode.PLAYER_2:
        cellColor = Colors.red;
        break;
      default:
        cellColor = Colors.white;
    }
    if (!Controller.getInstance().doesConnectFour(row, col) && currentCellMode != CellMode.EMPTY && isGameOver) {
      cellColor = cellColor.withOpacity(0.5);
    }
    return cellColor;
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
