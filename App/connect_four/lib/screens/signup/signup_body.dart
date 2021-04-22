
import 'package:connect_four/components/already_have_an_account_acheck.dart';
import 'package:connect_four/components/rounded_button.dart';
import 'package:connect_four/components/rounded_input_field.dart';
import 'package:connect_four/components/rounded_password_field.dart';
import 'package:connect_four/constants/constants.dart';
import 'package:connect_four/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
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
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {},
              icon: Icon(
                Icons.app_registration,
                color: Constants.PrimaryLightColor,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
