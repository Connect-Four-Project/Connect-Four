import 'package:connect_four/constants/constants.dart';
import 'package:flutter/material.dart';

class GameTextTitle extends StatelessWidget {
  final String title;
  final Color shadowColor;
  final Color textColor;

  const GameTextTitle({
    Key key,
    this.title,
    this.shadowColor: Constants.PrimaryDarkColor,
    this.textColor: Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(
      title,
      style: TextStyle(
        color: textColor,
        shadows: [
          Shadow(
            color: shadowColor,
            blurRadius: 2.0,
            offset: Offset(-3.0, 2.0),
          ),
        ],
        fontFamily: 'PressStart2P',
        fontSize: size.width * 0.075,
      ),
    );
  }
}
