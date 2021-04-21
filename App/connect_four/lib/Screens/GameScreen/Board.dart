import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'column.dart';

List<BoardColumn> buildBoard() {
  List<BoardColumn> columns = <BoardColumn>[];
  for (int i = 0; i < 7; ++i) {
    columns.add(new BoardColumn());
  }
  return columns;
}

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30 , 120 , 30 , 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buildBoard(),
      ),
    );
  }
}
