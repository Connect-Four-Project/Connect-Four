import 'package:connect_four/constants/constants.dart';
import 'package:connect_four/screens/game_screen/cell.dart';

class Controller {
  static Controller _instance;

  static Controller getInstance() {
    if (_instance == null) _instance = Controller._();
    return _instance;
  }

  int _playerTurn;
  List<List<CellMode>> _cellMode;
  List<int> _lastRowCell;

  Controller._() {
    _playerTurn = 0;
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
    _playerTurn = (_playerTurn + 1) % 2;
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

  }
}
