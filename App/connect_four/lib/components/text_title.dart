import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;
  final Color color;
  const TextTitle({
    Key key,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black,
            blurRadius: 10.0,
            offset: Offset(5.0, 5.0),
          ),
          Shadow(
            color: Colors.blueAccent,
            blurRadius: 10.0,
            offset: Offset(-5.0, 5.0),
          ),
        ],
        fontFamily: 'PressStart2P',
        fontSize: size.width * 0.075,
      ),
    );
  }
}
