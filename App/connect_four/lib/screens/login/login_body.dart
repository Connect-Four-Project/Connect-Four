import 'package:connect_four/Screens/Signup/signup_screen.dart';
import 'package:connect_four/components/already_have_an_account_acheck.dart';
import 'package:connect_four/components/rounded_button.dart';
import 'package:connect_four/components/rounded_input_field.dart';
import 'package:connect_four/components/rounded_password_field.dart';
import 'package:connect_four/components/text_title.dart';
import 'package:connect_four/constants/constants.dart';
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
            TextTitle(
              title: "SIGN IN",
              color: Constants.PrimaryDarkColor,
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
                color: Constants.PrimaryLightColor,
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
