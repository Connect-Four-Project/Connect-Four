import 'package:connect_four/Screens/Signup/signup_screen.dart';
import 'package:connect_four/components/already_have_an_account_acheck.dart';
import 'package:connect_four/components/rounded_button.dart';
import 'package:connect_four/components/rounded_input_field.dart';
import 'package:connect_four/components/rounded_password_field.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN IN",
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
              text: "SIGN IN",
              press: () {},
              icon: Icon(
                Icons.login_rounded,
                color: Color(0xFFD3C6E3),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
