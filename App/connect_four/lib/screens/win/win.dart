import 'package:flutter/material.dart';

class win extends StatelessWidget {
  String message;

  win({this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        message,
      ),
    );
  }
}
