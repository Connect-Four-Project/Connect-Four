import 'package:flutter/material.dart';
import 'background/background_widget.dart';
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
      home: MyHomePage(
        title: 'Connect Four',
      ),
      // WelcomeScreen(),
    );
  }
}
