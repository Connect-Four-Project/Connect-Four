import 'package:connect_four/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'constants/constants.dart';

void main() => runApp(ConnectFourApp());

class ConnectFourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Connect Four',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: WelcomeScreen());
  }
}
