import 'package:connect_four/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:connect_four/Screens/Login/login_screen.dart';
import 'package:connect_four/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

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
                fontSize: 60,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            RawMaterialButton(
              fillColor: Color(0xFF6F35A5),
              splashColor: Color(0xFFF1E6FF),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.public,
                      color: Color(0xFFF1E6FF),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Play Online",
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'PressStart2P',
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
              shape: const StadiumBorder(),
            ),
            RawMaterialButton(
              fillColor: Color(0xFF6F35A5),
              splashColor: Color(0xFFF1E6FF),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.group,
                      color: Color(0xFFF1E6FF),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "2 Players (Offline)",
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'PressStart2P',
                      ),
                    ),
                  ],
                ),
              ),
              shape: const StadiumBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
