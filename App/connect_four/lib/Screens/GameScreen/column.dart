import 'package:flutter/material.dart';

import 'Cell.dart';

class BoardColumn extends StatelessWidget {
  List<Cell> buildColumnCells() {
    List<Cell> cells = <Cell>[];
    for (int i = 0; i < 7; ++i) {
      cells.add(new Cell());
    }
    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: buildColumnCells());
  }
}
