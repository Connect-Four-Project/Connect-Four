import 'package:flutter/material.dart';

import 'coin.dart';

class Cell extends StatelessWidget {
  Coin buildCoin() {
    return Coin(
      coinColor: Colors.yellow,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          color: Colors.blue,
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.center,
          child: buildCoin(),
        ))
      ],
    );
  }
}
