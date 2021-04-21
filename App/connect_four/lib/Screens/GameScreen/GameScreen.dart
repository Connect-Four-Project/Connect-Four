import 'package:flutter/material.dart';

import 'GameBody.dart';

class GameScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Game Screen"),
        ),
        body: GameBody());
  }
}
