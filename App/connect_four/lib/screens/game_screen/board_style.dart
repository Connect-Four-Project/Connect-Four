import 'package:flutter/material.dart';

class BoardStyle extends StatelessWidget {
  final List<Widget>board ;

  BoardStyle({this.board});

  @override
  Widget build(BuildContext context) {
    return
      Container(
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
              children: board,
            ),
          ],
        ),
      );
  }
}
