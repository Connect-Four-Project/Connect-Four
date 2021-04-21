import 'package:flutter/material.dart';

import 'Cell.dart';

List<Cell> buildColumnCells() {
  List<Cell> cells = <Cell>[];
  for (int i = 0; i < 7; ++i) {
    cells.add(new Cell());
  }
  return cells;
}

class BoardColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: buildColumnCells());
  }
}
