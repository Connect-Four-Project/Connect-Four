import 'package:connect_four/constants/constants.dart';
import 'package:connect_four/game_controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'column.dart';

class Board extends StatefulWidget {
  Board() {
    Controller.getInstance().resetGame();
  }

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<Widget> _buildBoard() {
    List<Widget> column = <Widget>[];
    for (int j = 0; j < Constants.COLS; ++j) {
      column.add(
        GestureDetector(
          onTap: () {
            setState(() {
              Controller.getInstance().updateCell(Constants.ROWS - 1, j);
            });
          },
          child: BoardColumn(
            colNumber: j,
          ),
        ),
      );
    }
    return column;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.blue[800],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildBoard(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
