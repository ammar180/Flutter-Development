import 'game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<GameProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Consumer<GameProvider>(
            builder: (context, prov, child) => Text(
                "winner: ${(prov.winner == null) ? "Draw!" : prov.winner! ? "X Player!" : "O Player!"}")),
      ),
      body: Center(
          child: GridView.builder(
        itemBuilder: (context, index) {
          int targetRow = index ~/ 3;
          int targetCol = index - (targetRow * 3);
          return Cell(
            row: targetRow,
            col: targetCol,
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemCount: 9,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => prov.resetCells(),
        tooltip: 'restart',
        child: const Icon(Icons.restart_alt_rounded),
      ),
    );
  }
}

class Cell extends StatelessWidget {
  const Cell({super.key, required this.row, required this.col});
  final int row;
  final int col;

  @override
  Widget build(BuildContext context) {
    bool? cellValue;
    return Consumer<GameProvider>(builder: (context, prov, child) {
      cellValue = prov.cells[row][col];
      return InkWell(
        onTap: () {
          if (cellValue == null && prov.winner == null) {
            prov.updateCell(row, col);
            prov.switchPlayer();
            prov.checkWinner();
          }
        },
        child: Container(
          color: (cellValue == null)
              ? Colors.blue
              : cellValue!
                  ? Colors.green
                  : Colors.red,
          child: Center(
            child: Text(
              (cellValue == null)
                  ? ""
                  : cellValue!
                      ? "X"
                      : "O",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
      );
    });
  }
}
