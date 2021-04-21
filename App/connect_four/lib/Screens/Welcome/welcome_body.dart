import 'package:connect_four/Screens/GameScreen/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:connect_four/Screens/Login/login_screen.dart';
import 'package:connect_four/components/rounded_button.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "CONNECT FOUR",
              style: TextStyle(
                shadows: [
                  Shadow(
                    color: Color(0xFF6F35A5),
                    blurRadius: 10.0,
                    offset: Offset(5.0, 5.0),
                  ),
                  Shadow(
                    color: Color(0xFFF1E6FF),
                    blurRadius: 10.0,
                    offset: Offset(-5.0, 5.0),
                  ),
                ],
                fontFamily: 'PressStart2P',
                fontSize: size.width * 0.075,
              ),
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
                      return GameScreen();
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
