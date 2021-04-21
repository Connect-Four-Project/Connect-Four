import 'package:flutter/material.dart';

import 'Cell.dart';

class BoardColumn extends StatelessWidget {
  final int colNumber;

  const BoardColumn({Key key, @required this.colNumber}) : super(key: key);

  List<Cell> buildColumnCells() {
    List<Cell> cells = <Cell>[];
    for (int i = 0; i < 7; ++i) {
      cells.add(new Cell());
    }
    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(colNumber);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: buildColumnCells(),
      ),
    );
  }
}
