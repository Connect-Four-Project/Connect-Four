import 'package:connect_four/screens/game_screen/cell.dart';
import 'package:connect_four/constants/constants.dart';
import 'package:connect_four/game_controller/controller.dart';
import 'package:flutter/material.dart';

class BoardColumn extends StatelessWidget {
  BoardColumn({Key key, @required this.colNumber}) : super(key: key);
  final int colNumber;

  List<Cell> _buildColumnCells() {
    List<Cell> columns = <Cell>[];
    for (int i = 0; i < Constants.ROWS; ++i) {
      columns.add(
        new Cell(
          currentCellMode: Controller.getInstance().getCellMode(i, colNumber),
        ),
      );
    }
    return columns;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _buildColumnCells(),
    );
  }
}
