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
              "WELCOME TO CONNECT FOUR",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/connect.svg",
              height: size.height * 0.2,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "PLAY ONLINE",
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
            ),
            RoundedButton(
              text: "PLAY OFFLINE",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
