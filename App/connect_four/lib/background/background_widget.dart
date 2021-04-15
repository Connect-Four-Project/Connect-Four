import 'package:flutter/material.dart';
import 'dynamic_background.dart';
import 'dart:ui';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  BackgroundState createState() => BackgroundState();
}

class BackgroundState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  StatelessWidget statelessWidget;
  AnimationController animationController;

  @override
  void initState() {
    statelessWidget = Text("Hi");
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(animation: animationController.view),
            ),
          ),
          statelessWidget
        ],
      ),
    );
  }
}
