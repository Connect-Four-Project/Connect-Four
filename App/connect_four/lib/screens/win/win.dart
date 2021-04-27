import 'package:flutter/material.dart';

class win extends StatelessWidget {
  String winner;

  win({this.winner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        winner,
      ),
    );
  }
}
