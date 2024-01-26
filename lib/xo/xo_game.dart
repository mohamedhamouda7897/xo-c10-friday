import 'package:basics_c10_friday/slider/slider_screen.dart';
import 'package:basics_c10_friday/xo/board_btn.dart';
import 'package:basics_c10_friday/xo/players_model.dart';
import 'package:flutter/material.dart';

class XoGame extends StatefulWidget {
  static const String routeName = "xoGame";

  const XoGame({super.key});

  @override
  State<XoGame> createState() => _XoGameState();
}

class _XoGameState extends State<XoGame> {
  int score1 = 0;
  int score2 = 0;
  int counter = 1;

  List<String> boardState = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    PlayersModel model =
        ModalRoute.of(context)!.settings.arguments as PlayersModel;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Xo Game"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, SliderScreen.routeName, (route) => false);
              },
              icon: Icon(Icons.send))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        model.player1Name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      Text("$score1",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(model.player2Name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500)),
                      Text("$score2",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardBtn(
                  label: boardState[0],
                  index: 0,
                  onClick: onBoardBtnClicked,
                ),
                BoardBtn(
                  label: boardState[1],
                  index: 1,
                  onClick: onBoardBtnClicked,
                ),
                BoardBtn(
                  label: boardState[2],
                  index: 2,
                  onClick: onBoardBtnClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardBtn(
                  label: boardState[3],
                  index: 3,
                  onClick: onBoardBtnClicked,
                ),
                BoardBtn(
                  label: boardState[4],
                  index: 4,
                  onClick: onBoardBtnClicked,
                ),
                BoardBtn(
                  label: boardState[5],
                  index: 5,
                  onClick: onBoardBtnClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardBtn(
                  label: boardState[6],
                  index: 6,
                  onClick: onBoardBtnClicked,
                ),
                BoardBtn(
                  label: boardState[7],
                  index: 7,
                  onClick: onBoardBtnClicked,
                ),
                BoardBtn(
                  label: boardState[8],
                  index: 8,
                  onClick: onBoardBtnClicked,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onBoardBtnClicked(index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter.isOdd) {
      boardState[index] = "X";
      score1 += 2;
      bool win = checkWin("X");
      if (win) {
        score1 += 10;
        resetBoard();
      }
    } else {
      boardState[index] = "O";
      score2 += 2;
      bool win = checkWin("O");

      if (win) {
        score2 += 10;
        resetBoard();
      }
    }
    counter++;
    setState(() {});
  }

  resetBoard() {
    boardState = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
  }

  bool checkWin(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (symbol == boardState[i] &&
          symbol == boardState[i + 1] &&
          symbol == boardState[i + 2]) {
        return true;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (symbol == boardState[i] &&
          symbol == boardState[i + 3] &&
          symbol == boardState[i + 6]) {
        return true;
      }
    }

    if (symbol == boardState[0] &&
        symbol == boardState[4] &&
        symbol == boardState[8]) {
      return true;
    }
    if (symbol == boardState[2] &&
        symbol == boardState[4] &&
        symbol == boardState[6]) {
      return true;
    }

    return false;
  }
}
