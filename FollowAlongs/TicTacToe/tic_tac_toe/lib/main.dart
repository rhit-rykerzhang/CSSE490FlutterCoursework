import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Tic_Tac_Toe_Game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Tic Tac Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var game = TicTacToeGame();

  String get gameStateString {
    switch (game.state) {
      case TicTacToeState.xTurn:
        // TODO: Handle this case.
        return "X's Turn";
        break;
      case TicTacToeState.oTurn:
        // TODO: Handle this case.
        return "O's Turn";
        break;
      case TicTacToeState.xWon:
        // TODO: Handle this case.
        return "X won";
        break;
      case TicTacToeState.oWon:
        // TODO: Handle this case.
        return "O won";
        break;
      case TicTacToeState.tie:
        // TODO: Handle this case.
        return "Tie game!";
        break;
    }
    return 'Test';
  }

  @override
  Widget build(BuildContext context) {
    final squareButtons = <Widget>[];
    for (var k = 0; k < 9; k++) {
      var filename = "blank.png";
      if (game.board[k] == TicTacToeMark.x) {
        filename = "x.png";
      } else if (game.board[k] == TicTacToeMark.o) {
        filename = "o.png";
      }
      squareButtons.add(InkWell(
              onTap: () {
                print("You clicked $k");
                setState(() {
                  game.pressedSquare(k);
                });
              },
              child: Image.asset("images/$filename"))
          // ElevatedButton(
          //     onPressed: () {
          //       print("You pressed button number $k");
          //       setState(() {
          //         game.pressedSquare(k);
          //       });
          //       print("newState == $game ");
          //     },
          //     child: Text(
          //       (game.board[k] == TicTacToeMark.x)
          //           ? "x"
          //           : ((game.board[k] == TicTacToeMark.o) ? "O" : " "),
          //       style: TextStyle(fontSize: 90),
          //     )),
          );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                gameStateString,
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 15.0,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Stack(
                    //fit: StackFit.expand,
                    children: [
                      Image.asset("images/board.png"),
                      GridView.count(
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 50,
                        mainAxisSpacing: 50,
                        crossAxisCount: 3,
                        children: squareButtons,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      print("You pressed new game.");
                      setState(() {
                        game = TicTacToeGame();
                      });
                    },
                    child: const Text('New Game',
                        style: TextStyle(fontSize: 30.0)),
                  ),
                  SizedBox(width: 28)
                ],
              ),
            ],
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
