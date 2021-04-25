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

class _BoardState extends State<Board> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;
  Animation _shadowTween;

  @override
  initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _colorTween = ColorTween(begin: Colors.yellow, end: Colors.red)
        .animate(_animationController);
    _shadowTween =
        ColorTween(begin: Colors.amber, end: Constants.PrimaryDarkColor)
            .animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  List<Widget> _buildBoard() {
    List<Widget> column = <Widget>[];
    for (int j = 0; j < Constants.COLS; ++j) {
      column.add(
        GestureDetector(
          onTap: () {
            setState(() {
              Controller.getInstance().playColumn(j);
              if (Controller.getInstance().isPlayerOneTurn())
                _animationController.reverse();
              else
                _animationController.forward();
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

  Widget getText(Size size) {
    return Text(
      Controller.getInstance().isPlayerOneTurn() ? 'PLAYER ONE' : 'PLAYER TWO',
      style: TextStyle(
        color: _colorTween.value,
        shadows: [
          Shadow(
            color: _shadowTween.value,
            blurRadius: 2.0,
            offset: Offset(-3.0, 2.0),
          ),
        ],
        fontFamily: 'PressStart2P',
        fontSize: size.width * 0.075,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getText(size),
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
      },
    );
  }
}
