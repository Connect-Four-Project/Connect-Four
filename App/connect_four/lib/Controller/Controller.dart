import 'package:connect_four/Screens/GameScreen/cell.dart';
import 'package:connect_four/constants/constants.dart';

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
    _isEmpty = new List.generate(Constants.ROWS,
        (i) => List.generate(Constants.COLS, (j) => CellMode.EMPTY));
  }

  void updateCell(int row, int col) {
    if (row >= 0) {
      _isEmpty[row][col] = _getPlayerCell();
      _playerTurn = (_playerTurn + 1) % 2;
    }
  }

  CellMode getCellMode(int row, int col) {
    return _isEmpty[row][col];
  }

  CellMode _getPlayerCell() {
    if (_playerTurn == 0) return CellMode.PLAYER_1;
    return CellMode.PLAYER_2;
  }
  
}
