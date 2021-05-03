import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connect_four/components/rounded_button.dart';
import 'package:connect_four/constants/constants.dart';
import 'package:connect_four/screens/game_screen/board_style.dart';
import 'package:connect_four/screens/game_screen/column.dart';
import 'package:connect_four/screens/welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Finish extends StatelessWidget {
  String message;

  Finish({this.message});

  List<Widget> _finalBoardBuilder() {
    List<Widget> column = <Widget>[];
    for (int j = 0; j < Constants.COLS; ++j) {
      column.add(BoardColumn(colNumber: j , isGameOver: true,));
    }
    return column;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.width * 0.05),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: size.width * 0.1,
                fontFamily: "Nunito",
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(message),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
            SizedBox(height: size.width * 0.05),
            BoardStyle(board: _finalBoardBuilder()),
            SizedBox(height: size.width * 0.05),
            RoundedButton(
              text: "PLAY AGAIN ",
              press: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.keyboard_return_rounded,
                color: Constants.PrimaryLightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
