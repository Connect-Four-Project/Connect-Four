import 'package:flutter/material.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'constants/constants.dart';

void main() => runApp(ConnectFourApp());

class ConnectFourApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Connect Four',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
