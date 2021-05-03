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

  Widget getText2(Size size) {
    return DefaultTextStyle(
      key: UniqueKey(),
      style: TextStyle(
        color: Controller.getInstance().isPlayerOneTurn()
            ? Colors.yellow
            : Colors.red,
        shadows: [
          Shadow(
            color: Controller.getInstance().isPlayerOneTurn()
                ? Colors.amber[800]
                : Constants.PrimaryDarkColor,
            blurRadius: 2.0,
            offset: Offset(-3.0, 2.0),
          ),
        ],
        fontFamily: 'Nunito',
        fontSize: size.width * 0.145,
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -1),
          end: Offset(0, 0),
        ).animate(animationController),
        child: Text(
          Controller.getInstance().isPlayerOneTurn() ? 'ONE' : 'TWO',
        ),
      ),
    );
  }

  Widget getText(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.035,
          height: 0,
        ),
        DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
            shadows: [
              Shadow(
                color: Constants.PrimaryDarkColor,
                blurRadius: 2.0,
                offset: Offset(-3.0, 2.0),
              ),
            ],
            fontFamily: 'Nunito',
            fontSize: size.width * 0.135,
          ),
          child: Text(
            'PLAYER',
          ),
        ),
        SizedBox(
          width: size.width * 0.035,
          height: 0,
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: getText2(size),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getText(size),
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
