import 'package:flutter/material.dart';

import 'Cell.dart';
import 'Controller.dart';

class BoardColumn extends StatefulWidget {
  final int colNumber;

  BoardColumn({Key key, @required this.colNumber}) : super(key: key);

  @override
  _BoardColumnState createState() =>
      _BoardColumnState(colNumber: this.colNumber);
}

class _BoardColumnState extends State<BoardColumn> {
  int playerTurn, lastCell, colNumber;

  @override
  void initState() {
    super.initState();
    lastCell = 6;
    playerTurn = 0;
  }

  _BoardColumnState({@required this.colNumber});

  List<List<int>> isEmpty =
      new List.generate(8, (i) => List.generate(8, (j) => -1));

  List<Cell> buildColumnCells() {
    List<Cell> cells = <Cell>[];
    for (int i = 0; i < 7; ++i) {
      cells.add(new Cell(
        currentCellMode: ((isEmpty[colNumber][i] == -1)
            ? CellMode.EMPTY
            : (isEmpty[colNumber][i] == 1 ? CellMode.RED : CellMode.YELLOW)),
      ));
    }
    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEmpty = Controller.change(lastCell, colNumber);
          lastCell--;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: buildColumnCells(),
      ),
    );
  }
}
