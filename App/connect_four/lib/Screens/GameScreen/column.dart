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
  int lastCell, colNumber;

  @override
  void initState() {
    super.initState();
    lastCell = 6;
  }

  _BoardColumnState({@required this.colNumber});

  List<Cell> buildColumnCells() {
    List<Cell> cells = <Cell>[];

    for (int i = 0; i < 7; ++i) {
      cells.add(
        new Cell(
            currentCellMode:
                Controller.getInstance().getCellMode(i, colNumber)),
      );
    }
    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Controller.getInstance().change(lastCell, colNumber);
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
