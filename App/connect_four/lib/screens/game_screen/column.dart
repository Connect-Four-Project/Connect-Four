import 'package:connect_four/screens/game_screen/cell.dart';
import 'package:connect_four/constants/constants.dart';
import 'package:connect_four/game_controller/controller.dart';
import 'package:flutter/material.dart';


class BoardColumn extends StatefulWidget {
  final int colNumber;

  BoardColumn({Key key, @required this.colNumber}) : super(key: key);

  @override
  _BoardColumnState createState() =>
      _BoardColumnState(colNumber: this.colNumber);
}

class _BoardColumnState extends State<BoardColumn> {
  int lastCell, colNumber;

  @override
  void initState() {
    super.initState();
    lastCell = Constants.ROWS - 1;
  }

  _BoardColumnState({@required this.colNumber});

  List<Cell> _buildColumnCells() {
    List<Cell> columns = <Cell>[];
    for (int i = 0; i < Constants.ROWS; ++i) {
      columns.add(
        new Cell(currentCellMode: Controller.getInstance().getCellMode(i, colNumber)),
      );
    }
    return columns;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Controller.getInstance().updateCell(lastCell, colNumber);
          lastCell--;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildColumnCells(),
      ),
    );
  }
}
