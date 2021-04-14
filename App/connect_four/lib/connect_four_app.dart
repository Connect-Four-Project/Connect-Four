import 'package:flutter/material.dart';
import 'home_page.dart';

class ConnectFourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect Four',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Connect Four Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}
