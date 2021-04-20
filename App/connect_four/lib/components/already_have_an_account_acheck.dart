import 'package:connect_four/components/or_divider.dart';
import 'package:connect_four/constants/constants.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;

  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              login ? "Don’t have an Account? " : "Already have an Account? ",
              style: TextStyle(
                color: Constants.PrimaryColor,
                fontFamily: "NunitoLight",
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: press,
              child: Text(
                login ? "Sign Up" : "Sign In",
                style: TextStyle(
                  color: Constants.PrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Nunito",
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
