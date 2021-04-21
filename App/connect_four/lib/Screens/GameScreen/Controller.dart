import 'package:connect_four/Screens/GameScreen/Cell.dart';

class Controller {
  static Controller _instance;

  static Controller getInstance() {
    if (_instance == null) _instance = Controller._();
    return _instance;
  }

  int _playerTurn;
  List<List<CellMode>> _isEmpty;

  Controller._() {
    _playerTurn = 0;
    _isEmpty =
        new List.generate(8, (i) => List.generate(8, (j) => CellMode.EMPTY));
  }

  void change(int lastCell, int colNumber) {
    if (lastCell >= 0) {
      _isEmpty[lastCell][colNumber] = _getPlayerCell();
      _playerTurn = (_playerTurn + 1) % 2;
    }
  }

  CellMode getCellMode(int i, int j) {
    return _isEmpty[i][j];
  }

  CellMode _getPlayerCell() {
    if (_playerTurn == 0) return CellMode.PLAYER_1;
    return CellMode.PLAYER_2;
  }
}
