import 'package:connect_four/components/rounded_button.dart';
import 'package:connect_four/components/text_title.dart';
import 'package:connect_four/constants/constants.dart';
import 'package:connect_four/screens/game_screen/game_screen.dart';
import 'package:connect_four/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextTitle(
              title: "CONNECT FOUR",
              color: Constants.PrimaryDarkColor,
            ),
            SizedBox(height: size.height * 0.1),
            RoundedButton(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
              text: "PLAY ONLINE",
              icon: Icon(
                Icons.public,
                color: Color(0xFFF1E6FF),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return new GameScreen();
                    },
                  ),
                );
              },
              text: "2 PLAYERS (OFFLINE)",
              icon: Icon(
                Icons.group,
                color: Color(0xFFF1E6FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
