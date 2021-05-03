import 'package:connect_four/constants/constants.dart';
import 'package:connect_four/game_controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'board_style.dart';
import 'column.dart';

class Board extends StatefulWidget {
  Board() {
    Controller.getInstance().resetGame();
  }

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animationController.forward();
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  List<Widget> _buildBoard() {
    List<Widget> column = <Widget>[];
    for (int j = 0; j < Constants.COLS; ++j) {
      column.add(
        GestureDetector(
          onTap: () {
            Controller.getInstance().playColumn(j, setState, context);
          },
          child: BoardColumn(
            colNumber: j,
            isGameOver: false,
          ),
        ),
      );
    }
    return column;
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
     //   getText(size),
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, 1),
                end: Offset(0, 0),
              ).animate(animationController),
              child: BoardStyle(board: _buildBoard())),
        ),
      ],
    );
  }
}
