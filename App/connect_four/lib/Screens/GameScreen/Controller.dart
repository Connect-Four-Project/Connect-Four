import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'column.dart';

class Controller {
  static int playerTurn = 0;

  static List<List<int>> isEmpty = new List.generate(8, (i) => List.generate(8, (j) => -1));

  static void change(int lastCell, int colNumber) {
    if (lastCell >= 0) {
      isEmpty[colNumber][lastCell] = playerTurn;
      playerTurn = (playerTurn + 1) % 2;
      print(playerTurn);
    }
  }
}
