import 'package:connect_four/constants/constants.dart';
import 'package:connect_four/screens/game_screen/cell.dart';
import 'package:flutter/cupertino.dart';

class Controller {
  static Controller _instance;

  static Controller getInstance() {
    if (_instance == null) _instance = Controller._();
    return _instance;
  }

  int _playerTurn;
  bool gameOver;
  List<List<CellMode>> _cellMode;
  List<int> _lastRowCell;

  Controller._() {
    _playerTurn = 0;
    gameOver = false;
    _cellMode = new List.generate(Constants.ROWS,
        (i) => List.generate(Constants.COLS, (j) => CellMode.EMPTY));
    _lastRowCell = new List.generate(Constants.COLS, (i) => Constants.ROWS - 1);
  }

  void playColumn(int col) {
    if (_lastRowCell[col] >= 0) {
      _updateCell(_lastRowCell[col], col);
      _lastRowCell[col]--;
    }
  }

  void _updateCell(int row, int col) {
    _cellMode[row][col] = _getPlayerCell();
    gameOver = doesConnectFour(row, col);
    _playerTurn = _playerTurn ^ 1;
  }

  CellMode getCellMode(int row, int col) {
    return _cellMode[row][col];
  }

  CellMode _getPlayerCell() {
    if (_playerTurn == 0) return CellMode.PLAYER_1;
    return CellMode.PLAYER_2;
  }

  void resetGame() {
    _playerTurn = 0;
    gameOver = false;
    for (int i = 0; i < Constants.ROWS; ++i) {
      for (int j = 0; j < Constants.COLS; j++) {
        _cellMode[i][j] = CellMode.EMPTY;
      }
    }
  }

  bool isPlayerOneTurn() {
    return _playerTurn == 0 ? true : false;
  }

  bool isGameOver() {
    return gameOver;
  }

  bool isInsideBoard(int row, int col) {
    return row >= 0 && row < Constants.ROWS && col >= 0 && col < Constants.COLS;
  }

  bool doesConnectFour(int row, int col) {
    var dr = [-1, -1, 0, 1];
    var dc = [0, 1, 1, 1];
    for (int i = 0; i < 4; i++) {
      int count = 0, r = row, c = col;
      while (
          isInsideBoard(r, c) && getCellMode(row, col) == getCellMode(r, c)) {
        count++;
        r += dr[i];
        c += dc[i];
      }

      r = row - dr[i];
      c = col - dc[i];

      while (
          isInsideBoard(r, c) && getCellMode(row, col) == getCellMode(r, c)) {
        count++;
        r -= dr[i];
        c -= dc[i];
      }

      if (count >= 4) return true;
    }

    return false;
  }
}
