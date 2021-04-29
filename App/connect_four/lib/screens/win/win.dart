import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connect_four/components/rounded_button.dart';
import 'package:connect_four/constants/constants.dart';
import 'package:connect_four/screens/welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class win extends StatelessWidget {
  String message;

  win({this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: const TextStyle(fontSize: 60.0, fontFamily: "Nunito"),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(message),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),

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
