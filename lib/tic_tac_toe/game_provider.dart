import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  bool currentPlayer = true;
  bool? winner;
  List<List<bool?>> cells = List.generate(
    3,
    (_) => List.generate(3, (_) => null),
  );

  void resetCells() {
    currentPlayer = true;
    cells = List.generate(3, (_) => List.generate(3, (_) => null));
    winner = null;
    notifyListeners();
  }

  void switchPlayer() {
    currentPlayer = !currentPlayer;
  }

  void updateCell(int row, int col) {
    cells[row][col] = currentPlayer;
    notifyListeners();
  }

  void checkWinner() {
    // check diagonals
    winner =
        (cells[0][0] != null &&
                cells[0][0] == cells[1][1] &&
                cells[1][1] == cells[2][2])
            ? cells[1][1]
            : null;
    if (winner != null) return;
    winner =
        (cells[0][2] != null &&
                cells[0][2] == cells[1][1] &&
                cells[1][1] == cells[2][0])
            ? cells[1][1]
            : null;
    if (winner != null) return;
    for (var i = 0; i < 3; i++) {
      // checkrows
      for (var j = 0; j < 2; j++) {
        winner = (cells[i][j] == cells[i][j + 1]) ? cells[i][j] : null;
        if (winner == null) break;
      }
      if (winner != null) break;
      // check columns
      for (var k = 0; k < 2; k++) {
        winner = (cells[k][i] == cells[k + 1][i]) ? cells[k][i] : null;
        if (winner == null) break;
      }
      if (winner != null) break;
    }
  }
}
